using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using System.Net.Http;
using Newtonsoft.Json.Linq;
using InfiniteMeals.Kitchens.Model;
using System.Collections.ObjectModel;
using System.Globalization;
using InfiniteMeals.Meals;
using InfiniteMeals.SignUp;

namespace InfiniteMeals.Kitchens.Controller
{
    public partial class MainPage : ContentPage
    {

        ObservableCollection<KitchensModel> Kitchens = new ObservableCollection<KitchensModel>();


        private async void ClickedSignUp(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SignUp.SignUp());
        }

        private async void ClickedMealSchedule(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Meals.MealSchedule());
        }

        private async void ClickedUserProfile(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Profile.UserProfile());
        }

        private async void ClickedSubscribe(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Subscribe.Subscribe());
        }


        protected async void GetKitchens()
        {
            var request = new HttpRequestMessage();
            request.RequestUri = new Uri("https://phaqvwjbw6.execute-api.us-west-1.amazonaws.com/dev/api/v1/kitchens");
            request.Method = HttpMethod.Get;
            var client = new HttpClient();
            HttpResponseMessage response = await client.SendAsync(request);
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                HttpContent content = response.Content;
                var kitchensString = await content.ReadAsStringAsync();
                JObject kitchens = JObject.Parse(kitchensString);
                this.Kitchens.Clear();

                foreach (var k in kitchens["result"])
                {
                    Boolean businessIsOpen;
                    string accepting_hours;
                    int dayOfWeekIndex = getDayOfWeekIndex(DateTime.Today);
                    if ((Boolean)k["isOpen"]["BOOL"] == false)
                    {
                        accepting_hours = "Not accepting orders, no meals";
                        businessIsOpen = false;
                    }
                    else if ((Boolean)k["is_accepting_24hr"]["BOOL"] == true)
                    {
                        accepting_hours = "24 hours";
                        businessIsOpen = true;
                    }
                    else
                    {
                        string start_time_12 = ConvertFromToTime((string)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["open_time"]["S"], "HH:mm", "h:mm tt");
                        string end_time_12 = ConvertFromToTime((string)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["close_time"]["S"], "HH:mm", "h:mm tt");
                        string start_time_24 = (string)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["open_time"]["S"];
                        string end_time_24 = (string)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["close_time"]["S"];
                        Boolean isAccepting = (Boolean)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["is_accepting"]["BOOL"];
                        businessIsOpen = isBusinessOpen(TimeSpan.Parse(start_time_24), TimeSpan.Parse(end_time_24), isAccepting);
                        accepting_hours = whenAccepting(businessIsOpen, k, dayOfWeekIndex);
                    }
                    string delivery_hours = whenDelivering(dayOfWeekIndex, k);
                  
                    this.Kitchens.Add(new KitchensModel()
                    {
                        kitchen_id = k["kitchen_id"]["S"].ToString(),
                        zipcode = formatZipcode(k["zipcode"]["S"].ToString()),
                        title = k["kitchen_name"]["S"].ToString(),
                        open_hours = accepting_hours,
                        delivery_period = delivery_hours,
                        description = k["description"]["S"].ToString(),
                        isOpen = businessIsOpen,
                        status = (businessIsOpen == true) ? "Open now" : "Closed",
                        statusColor = (businessIsOpen == true) ? "Green" : "Red",
                        opacity = (businessIsOpen == true) ? "1.0" : "0.6"
                    }
                    ) ;
                }

              //  kitchensListView.ItemsSource = Kitchens;
            }

        }

        public MainPage()
        {
            InitializeComponent();

            GetKitchens();

            homepage.Source = ImageSource.FromFile("homepage.jpg");

            //Kitchens.Clear();
            /*
            kitchensListView.RefreshCommand = new Command(() =>
            {
               GetKitchens();
               kitchensListView.IsRefreshing = false;
            });

            kitchensListView.ItemSelected += Handle_ItemTapped();
            */
        }

        private EventHandler<SelectedItemChangedEventArgs> Handle_ItemTapped()
        {
            return OnItemSelected;
        }

        async void OnItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            // disable selected item highlighting;
            if (e.SelectedItem == null) return;
            ((ListView)sender).SelectedItem = null;


            // do something with the selection
            var kitchen = e.SelectedItem as KitchensModel;

            // disable selection if the kitchen is closed
            if (kitchen.isOpen == false)
            {
                return;
            }

            await Navigation.PushAsync(new SelectMealOptions(kitchen.kitchen_id, kitchen.title, kitchen.zipcode));
        }

        //  Get integer index of day of the week, with 0 as Sunday
        private int getDayOfWeekIndex(DateTime day)
        {
            if (day.DayOfWeek == DayOfWeek.Sunday)
                return 0;
            if (day.DayOfWeek == DayOfWeek.Monday)
                return 1;
            if (day.DayOfWeek == DayOfWeek.Tuesday)
                return 2;
            if (day.DayOfWeek == DayOfWeek.Wednesday)
                return 3;
            if (day.DayOfWeek == DayOfWeek.Thursday)
                return 4;
            if (day.DayOfWeek == DayOfWeek.Friday)
                return 5;
            if (day.DayOfWeek == DayOfWeek.Saturday)
                return 6;
            return -1;
        }

        //  Get day of week string from intger index of the week, with 0 as Sunday
        private string getDayOfWeekFromIndex(int index)
        {
            if (index == 0)
                return "Sunday";
            if (index == 1)
                return "Monday";
            if (index == 2)
                return "Tuesday";
            if (index == 3)
                return "Wednesday";
            if (index == 4)
                return "Thursday";
            if (index == 5)
                return "Friday";
            if (index == 6)
                return "Saturday";
            return "Error";
        }

        //  Is the store already closed or is it opening later today?
        private int isAlreadyClosed(TimeSpan end_time)
        {
            TimeSpan now = DateTime.Now.TimeOfDay;
            if (now < end_time)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }

        //  When is the business accepting orders?
        private string whenAccepting(Boolean businessIsOpen, JToken k, int dayOfWeekIndex)
        {
            string end_time_12 = ConvertFromToTime((string)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["close_time"]["S"], "HH:mm", "h:mm tt");
            string end_time_24 = (string)k["accepting_hours"]["L"][dayOfWeekIndex]["M"]["close_time"]["S"];
            if (businessIsOpen == true)
            {
                return "Until " + end_time_12;
            }
            int nextOpenDay = nextPeriodDayIndex(dayOfWeekIndex, k, "accepting_hours", "is_accepting", isAlreadyClosed(TimeSpan.Parse(end_time_24)));
            if (nextOpenDay == -1)
            {
                return "Not currently accepting orders";
            }
            string next_day;
            if (nextOpenDay == dayOfWeekIndex)
            {
                next_day = "today";
            }
            else if (nextOpenDay == (dayOfWeekIndex + 1) % 7)
            {
                next_day = "tomorrow";
            }
            else
            {
                next_day = getDayOfWeekFromIndex(nextOpenDay);
            }
            return "Starting " + next_day + " " + ConvertFromToTime((string)k["accepting_hours"]["L"][nextOpenDay]["M"]["open_time"]["S"], "HH:mm", "h:mm tt");
        }

        //  When is the next delivery period?
        private string whenDelivering(int dayOfWeekIndex, JToken k)
        {
            int nextDeliveryDayIndex = nextPeriodDayIndex(dayOfWeekIndex, k, "delivery_hours", "is_delivering", 1);
            if (nextDeliveryDayIndex != -1)
            {
                var deliveryOpenTime = ConvertFromToTime((string)k["delivery_hours"]["L"][nextDeliveryDayIndex]["M"]["open_time"]["S"], "HH:mm", "h:mm tt");
                var deliveryCloseTime = ConvertFromToTime((string)k["delivery_hours"]["L"][nextDeliveryDayIndex]["M"]["close_time"]["S"], "HH:mm", "h:mm tt");
                return getDayOfWeekFromIndex(nextDeliveryDayIndex) + " " + deliveryOpenTime + " - " + deliveryCloseTime;
            }
            else
            {
                return "Not currently delivering";
            }
        }
        
        //  Get integer index of day of the week of next time (accepting or delivering) period, with 0 as Sunday
        //  3rd and 4th arguments take kitchen API list and boolean keys (e.g. delivery_hours and is_delivering)
        //  5th argument takes the number of days to wait before beginning the check. For instance, if you want to find the next delivery period starting the day after today, argument should be 1.
        private int nextPeriodDayIndex(int dayOfTheWeek, JToken kitchen, string list_key, string bool_key, int dayDelay)
        {
            int dayIndex;
            for (int i=dayDelay; i<dayDelay+7; i++)
            {
                dayIndex = (dayOfTheWeek + i) % 7;
                if ((Boolean)kitchen[list_key]["L"][dayIndex]["M"][bool_key]["BOOL"] == true)
                {
                    return dayIndex;
                }
            }
            return -1;
        }

        //  Function checking if business is currently open
        private Boolean isBusinessOpen(TimeSpan open_time, TimeSpan close_time, Boolean is_accepting)
        {
            TimeSpan now = DateTime.Now.TimeOfDay;
            //  Accepting orders on current day?
            if (is_accepting == false)
            {
                return false;
            }
            else
            {
                //  Opening and closing hours on same day
                if (open_time <= close_time)
                {
                    if (now >= open_time && now <= close_time)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                //  Opening and closing hours on different day
                else
                {
                    if (now >= open_time || now <= close_time)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }


        private string formatZipcode(string zipcode)
        {
            if (zipcode == "95120")
            {
                return "Almaden";
            }
            if (zipcode == "95135")
            {
                return "Evergreen";
            }
            if (zipcode == "95060")
            {
                return "Santa Cruz";
            }
            return "Other";
        }

        // https://www.niceonecode.com/Question/20540/how-to-convert-24-hours-string-format-to-12-hours-format-in-csharp
        public static string ConvertFromToTime(string timeHour, string inputFormat, string outputFormat)
        {
            var timeFromInput = DateTime.ParseExact(timeHour, inputFormat, null, DateTimeStyles.None);
            string timeOutput = timeFromInput.ToString(
                outputFormat,
                CultureInfo.InvariantCulture);
            return timeOutput;
        }
    }
}
