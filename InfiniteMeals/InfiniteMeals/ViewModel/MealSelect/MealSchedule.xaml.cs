using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Database;
using InfiniteMeals.Meals.Model;
using InfiniteMeals.MealSelect;
using System.Runtime.Serialization;
using InfiniteMeals.Model.Meals;

namespace InfiniteMeals.Meals {

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealSchedule : ContentPage
    {
        int ctr = 2;
        private static int weekNumber = 0;
        private static bool disabled = false;
        public ListView lstView = new ListView { HasUnevenRows = true };
        public Button sundayButton = new Button();
        public List<String> purchaseIdList = new List<String>();
        private List<DateTimeOffset> weekAffectedList = new List<DateTimeOffset>();
        private static string[] deliveryDayArray = { "Sunday", "Sunday", "Sunday", "Sunday", "Sunday", "Sunday" };
        public static string green = "#8FBC8F";
        public static string def = "#F5F5F5";
        public static string yellow = "#FFE573";
        public static string subscriptionLabel = "Your Subscriptions";
        private static long numMeals;
        private List<string> allSubscriptions = new List<string>();
        private List<long> maxMealsList = new List<long>();

        public MealSchedule()
        {
            InitializeComponent();
            // Toolbar
            ToolbarItem totalBar = new ToolbarItem
            {
                Text = "Profile",
                IconImageSource = ImageSource.FromFile("oats.jpg"),
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            ToolbarItem totalBar2 = new ToolbarItem
            {
                Text = "Log Out",
                IconImageSource = ImageSource.FromFile("oats.jpg"),
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            this.ToolbarItems.Add(totalBar);
            this.ToolbarItems.Add(totalBar2);

            // Function Calls
            getData();
            subscriptionPicker();
            getDates();
            BindingContext = this;
        }

        private void getData()
        {
            nullPicker.SetValue(IsVisibleProperty, false);
            WebClient client = new WebClient();

            // Get user zipcodes
            var userZipCodes = client.DownloadString("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000001");
            var userZipObj = JsonConvert.DeserializeObject<UserInformation>(userZipCodes);

            Boolean zipBool = true;
            for (int i = 0; i < userZipObj.Result.Length; i++)
            {
                zipBool = userZipObj.Result[i].MondayAvailable;
            }

            zipBool = true;

            if (zipBool == true)
            {
                MondayButton.IsVisible = true;
                MondayButton2.IsVisible = true;
                MondayButton3.IsVisible = true;
                MondayButton4.IsVisible = true;
                MondayButton5.IsVisible = true;
                MondayButton6.IsVisible = true;
            }
        }

        private void subscriptionPicker()
        {
            WebClient client = new WebClient();
            // Get user zipcodes
            var userZipCodes = client.DownloadString("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000001");
            // Get subscription plans
            var subPlansObj = JsonConvert.DeserializeObject<UserInformation>(userZipCodes);

            SubscriptionPicker.Title = "Select A Subscription";

            for (int subNum = 0; subNum < subPlansObj.Result.Length; subNum++)
            {
                if (subPlansObj.Result[subNum].BuyerId == "100-000001")
                {
                    allSubscriptions.Add(subPlansObj.Result[subNum].MealPlanDesc);
                    maxMealsList.Add(subPlansObj.Result[subNum].MaximumMeals);
                    SubscriptionPicker.Items.Add(allSubscriptions[subNum]);
                }
            }
            SubscriptionPicker.SelectedIndexChanged += SubscriptionPicker_SelectedIndexChanged;
            BindingContext = this;
        }

        private void SubscriptionPicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            nullPicker.SetValue(IsVisibleProperty, false);
            SubscriptionPicker.Title = subscriptionLabel;
            numMeals = maxMealsList[SubscriptionPicker.SelectedIndex];
            HeaderLabel.Text = allSubscriptions[SubscriptionPicker.SelectedIndex];
        }

        private void clickSurprise(object sender , EventArgs e)
        {
            Button b = (Button)sender;
            if(b.ClassId.Equals("SurpriseButton") && SkipButton.BackgroundColor.Equals(Color.FromHex(green)))
            {
                b.BackgroundColor = Color.FromHex(def);
            }
            else if (b.ClassId.Equals("SurpriseButton2") && SkipButton2.BackgroundColor.Equals(Color.FromHex(green)))
            {
                b.BackgroundColor = Color.FromHex(def);
            }
            else if (b.ClassId.Equals("SurpriseButton3") && SkipButton3.BackgroundColor.Equals(Color.FromHex(green)))
            {
                b.BackgroundColor = Color.FromHex(def);
            }
            else if (b.ClassId.Equals("SurpriseButton4") && SkipButton4.BackgroundColor.Equals(Color.FromHex(green)))
            {
                b.BackgroundColor = Color.FromHex(def);
            }
            else if (b.ClassId.Equals("SurpriseButton5") && SkipButton5.BackgroundColor.Equals(Color.FromHex(green)))
            {
                b.BackgroundColor = Color.FromHex(def);
            }
            else if (b.ClassId.Equals("SurpriseButton6") && SkipButton6.BackgroundColor.Equals(Color.FromHex(green)))
            {
                b.BackgroundColor = Color.FromHex(def);
            }
            else
            {
                b.BackgroundColor = Color.FromHex(green);
                if(b.ClassId.Equals("SurpriseButton"))
                {
                    SelectButton.BackgroundColor = Color.FromHex(def);
                }
                else if(b.ClassId.Equals("SurpriseButton2"))
                {
                    SelectButton2.BackgroundColor = Color.FromHex(def);

                }
                else if (b.ClassId.Equals("SurpriseButton3"))
                {
                    SelectButton3.BackgroundColor = Color.FromHex(def);

                }
                else if (b.ClassId.Equals("SurpriseButton4"))
                {
                    SelectButton4.BackgroundColor = Color.FromHex(def);

                }
                else if (b.ClassId.Equals("SurpriseButton5"))
                {
                    SelectButton5.BackgroundColor = Color.FromHex(def);

                }
                else if (b.ClassId.Equals("SurpriseButton6"))
                {
                    SelectButton6.BackgroundColor = Color.FromHex(def);

                }
            }
        }

        public void ClickedColor(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            if (btn.ClassId == "SkipButton" | btn.ClassId == "SkipButton2" |
                btn.ClassId == "SkipButton3" | btn.ClassId == "SkipButton4"
                | btn.ClassId == "SkipButton5" | btn.ClassId == "SkipButton6")
            {
                if (btn.BackgroundColor.Equals(Color.FromHex(green)))
                {
                    btn.BackgroundColor = (Color.FromHex(def));
                    disabled = false;
                    ctr = 0;
                }
                else if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                {
                    btn.BackgroundColor = Color.FromHex(green);
                    switch (btn.ClassId)
                    {
                        case "SkipButton":
                            SundayButton.BackgroundColor = Color.FromHex(def);
                            MondayButton.BackgroundColor = Color.FromHex(def);
                            AddonButton.BackgroundColor = Color.FromHex(def);
                            SurpriseButton.BackgroundColor = Color.FromHex(def);
                            SelectButton.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            ctr = 2;
                            postSkipData(sender, e);
                            break;
                        case "SkipButton2":
                            SundayButton2.BackgroundColor = Color.FromHex(def);
                            MondayButton2.BackgroundColor = Color.FromHex(def);
                            AddonButton2.BackgroundColor = Color.FromHex(def);
                            SurpriseButton2.BackgroundColor = Color.FromHex(def);
                            SelectButton2.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            ctr = 2;
                            break;
                        case "SkipButton3":
                            SundayButton3.BackgroundColor = Color.FromHex(def);
                            MondayButton3.BackgroundColor = Color.FromHex(def);
                            AddonButton3.BackgroundColor = Color.FromHex(def);
                            SurpriseButton3.BackgroundColor = Color.FromHex(def);
                            SelectButton3.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            ctr = 2;
                            break;
                        case "SkipButton4":
                            SundayButton4.BackgroundColor = Color.FromHex(def);
                            MondayButton4.BackgroundColor = Color.FromHex(def);
                            AddonButton4.BackgroundColor = Color.FromHex(def);
                            SurpriseButton4.BackgroundColor = Color.FromHex(def);
                            SelectButton4.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            ctr = 2;
                            break;
                        case "SkipButton5":
                            SundayButton5.BackgroundColor = Color.FromHex(def);
                            MondayButton5.BackgroundColor = Color.FromHex(def);
                            AddonButton5.BackgroundColor = Color.FromHex(def);
                            SurpriseButton5.BackgroundColor = Color.FromHex(def);
                            SelectButton5.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            ctr = 2;
                            break;
                        case "SkipButton6":
                            SundayButton6.BackgroundColor = Color.FromHex(def);
                            MondayButton6.BackgroundColor = Color.FromHex(def);
                            AddonButton6.BackgroundColor = Color.FromHex(def);
                            SurpriseButton6.BackgroundColor = Color.FromHex(def);
                            SelectButton6.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            ctr = 2;
                            break;
                    }
                }
            }
            else
            {
                if (disabled == true)
                {
                    if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                    {
                        switch (btn.ClassId)
                        {
                            case "MonButton":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton.BackgroundColor = Color.FromHex(def);
                                SkipButton.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "MonButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton2.BackgroundColor = Color.FromHex(def);
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "MonButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton3.BackgroundColor = Color.FromHex(def);
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "MonButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton4.BackgroundColor = Color.FromHex(def);
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "MonButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton5.BackgroundColor = Color.FromHex(def);
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "MonButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton6.BackgroundColor = Color.FromHex(def);
                                SkipButton6.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "SunButton":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton.BackgroundColor = Color.FromHex(def);
                                SkipButton.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "SunButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton2.BackgroundColor = Color.FromHex(def);
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "SunButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton3.BackgroundColor = Color.FromHex(def);
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "SunButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton4.BackgroundColor = Color.FromHex(def);
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "SunButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton5.BackgroundColor = Color.FromHex(def);
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                disabled = false;
                                break;
                            case "SunButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton6.BackgroundColor = Color.FromHex(def);
                                SkipButton6.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[5] = "Sunday";
                                disabled = false;
                                break;
                        }
                    }
                }
                else if (disabled == false)
                {
                    if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                    {
                        switch (btn.ClassId)
                        {
                            case "MonButton":
                                SkipButton.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[0] = "Monday";
                                break;
                            case "MonButton2":
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Monday";
                                break;
                            case "MonButton3":
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Monday";
                                break;
                            case "MonButton4":
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Monday";
                                break;
                            case "MonButton5":
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton5.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[4] = "Monday";
                                break;
                            case "MonButton6":
                                SkipButton6.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton6.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[5] = "Monday";
                                break;
                            case "SunButton":
                                SkipButton.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[0] = "Sunday";
                                break;
                            case "SunButton2":
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Sunday";
                                break;
                            case "SunButton3":
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Sunday";

                                break;
                            case "SunButton4":
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Sunday";
                                break;
                            case "SunButton5":
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton5.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[4] = "Sunday";
                                break;
                            case "SunButton6":
                                SkipButton6.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton6.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[5] = "Sunday";
                                break;
                            case "SelectButton":
                                SurpriseButton.BackgroundColor = Color.FromHex(def);
                                weekNumber = 1;
                                setWeekNum(sender, e);
                                break;
                            case "SelectButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton2.BackgroundColor = Color.FromHex(def);
                                weekNumber = 2;
                                setWeekNum(sender, e);
                                break;
                            case "SelectButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton3.BackgroundColor = Color.FromHex(def);
                                setWeekNum(sender, e);
                                break;
                            case "SelectButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton4.BackgroundColor = Color.FromHex(def);
                                setWeekNum(sender, e);
                                break;
                            case "SelectButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton5.BackgroundColor = Color.FromHex(def);
                                setWeekNum(sender, e);
                                break;
                            case "SelectButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton6.BackgroundColor = Color.FromHex(def);
                                setWeekNum(sender, e);
                                break;
                            default:
                                btn.BackgroundColor = Color.FromHex(green);
                                ctr--;
                                break;
                        }
                    }
                    else
                    {
                        btn.BackgroundColor = (Color.FromHex(def));
                        ctr++;
                    }
                }
            }
            setDDArr();
            setWeekNum(sender, e);
        }

        private async void ClickedAddOn(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if(SkipButton.BackgroundColor.Equals(Color.FromHex(green)) | SkipButton2.BackgroundColor.Equals(Color.FromHex(green))
                | SkipButton3.BackgroundColor.Equals(Color.FromHex(green)) | SkipButton4.BackgroundColor.Equals(Color.FromHex(green))
                | SkipButton5.BackgroundColor.Equals(Color.FromHex(green)) | SkipButton6.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else
            {
                AddOnChoices ac = new AddOnChoices();
                ac.BindingContext = this;
                setWeekNum(sender, e);
                await Navigation.PushAsync(ac);
            }
        }

        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            if (SubscriptionPicker.SelectedItem == null)
            {
                nullPicker.TextColor = Color.FromHex("C21807");
                nullPicker.SetValue(IsVisibleProperty, true);

            }
            else
            {
                Button b = (Button)sender;
                if (SkipButton.BackgroundColor.Equals(Color.FromHex(green)) && b.ClassId.Equals("SelectButton"))
                {
                    SelectButton.BackgroundColor.Equals(def);
                    await Task.FromResult(0);

                }
                else if (SkipButton2.BackgroundColor.Equals(Color.FromHex(green)) && b.ClassId.Equals("SelectButton2"))
                {
                    SelectButton2.BackgroundColor.Equals(def);
                    await Task.FromResult(0);
                }
                else if (SkipButton3.BackgroundColor.Equals(Color.FromHex(green)) && b.ClassId.Equals("SelectButton3"))
                {
                    SelectButton3.BackgroundColor.Equals(def);
                    await Task.FromResult(0);
                }
                else if (SkipButton4.BackgroundColor.Equals(Color.FromHex(green)) && b.ClassId.Equals("SelectButton4"))
                {
                    SelectButton4.BackgroundColor.Equals(def);
                    await Task.FromResult(0);
                }
                else if (SkipButton5.BackgroundColor.Equals(Color.FromHex(green)) && b.ClassId.Equals("SelectButton5"))
                {
                    SelectButton5.BackgroundColor.Equals(def);
                    await Task.FromResult(0);

                }
                else if (SkipButton6.BackgroundColor.Equals(Color.FromHex(green)) && b.ClassId.Equals("SelectButton6"))
                {
                    SelectButton6.BackgroundColor.Equals(def);
                    await Task.FromResult(0);

                }
                else
                {
                    MealChoices mc = new MealChoices();
                    mc.BindingContext = this;
                    setWeekNum(sender, e);
                    await Navigation.PushAsync(mc);
                }
            }
        }

        public void getDates()
        {
            DateTimeOffset dateValue = DateTimeOffset.Now;
            DateTimeOffset firstSun, firstMon, firstSat;
            String dateText = dateValue.ToString("dddd");
            List<String> AllSundays = new List<String>();
            List<String> AllMondays = new List<String>();
            switch (dateText)
            {
                case "Sunday":
                    firstSat = dateValue.AddDays(7);
                    weekAffectedList.Add(firstSat);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(7 * (i + 1))));
                        weekAffectedList.Add(dateValue.AddDays(7 * (i + 1)));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays((7 * (i + 1)) + 1)));
                    }
                    for(int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
                case "Monday":
                    firstSat = dateValue.AddDays(5);
                    firstSun = dateValue.AddDays(6);
                    firstMon = firstSun.AddDays(1);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(6)));
                    weekAffectedList.Add(firstSat);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
                case "Tuesday":
                    firstSat = dateValue.AddDays(6);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(5)));
                    weekAffectedList.Add(firstSat);

                    firstSun = dateValue.AddDays(5);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
                case "Wednesday":
                    firstSat = dateValue.AddDays(3);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(4)));
                    weekAffectedList.Add(firstSat);

                    firstSun = dateValue.AddDays(4);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
                case "Thursday":
                    firstSat = dateValue.AddDays(9);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(10)));
                    weekAffectedList.Add(firstSat);

                    firstSun = dateValue.AddDays(10);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
                case "Friday":
                    firstSat = dateValue.AddDays(8);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(9)));
                    weekAffectedList.Add(firstSat);

                    firstSun = dateValue.AddDays(9);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
                case "Saturday":
                    firstSat = dateValue.AddDays(7);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(8)));
                    weekAffectedList.Add(firstSat);

                    firstSun = dateValue.AddDays(8);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                    }
                    SundayButton.Text = AllSundays[0];
                    SundayButton2.Text = AllSundays[1];
                    SundayButton3.Text = AllSundays[2];
                    SundayButton4.Text = AllSundays[3];
                    SundayButton5.Text = AllSundays[4];
                    SundayButton6.Text = AllSundays[5];
                    MondayButton.Text = AllMondays[0];
                    MondayButton2.Text = AllMondays[1];
                    MondayButton3.Text = AllMondays[2];
                    MondayButton4.Text = AllMondays[3];
                    MondayButton5.Text = AllMondays[4];
                    MondayButton6.Text = AllMondays[5];
                    break;
            }
        }

        public List<String> getPurchID()
        {
            WebClient client = new WebClient();

            // Get user zipcodes
            var userPurchClient = client.DownloadString("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000001");
            var userPurchID = JsonConvert.DeserializeObject<UserInfo>(userPurchClient);
            for (int i = 0; i < userPurchID.Result.Length; i++)
            {
                var purchaseID = userPurchID.Result[i].PaymentId.ToString();
                purchaseIdList.Add(purchaseID);
            }
            return purchaseIdList;
        }

        public List<DateTimeOffset> getWeekList()
        {
            return weekAffectedList;
        }

        public string[] getDDArray()
        {
            return deliveryDayArray;
        }

        public void setDDArr()
        {
            if (sundayButton.BackgroundColor.Equals(green))
            {
                deliveryDayArray[0] = "Sunday";
            }
            else if (MondayButton.BackgroundColor.Equals(green))
            {
                deliveryDayArray[0] = "Monday";
            }
            else if (SkipButton.BackgroundColor.Equals(green))
            {
                deliveryDayArray[0] = "Skip";
            }

            if (SundayButton2.BackgroundColor.Equals(green))
            {
                deliveryDayArray[1] = "Sunday";
            }
            else if (MondayButton2.BackgroundColor.Equals(green))
            {
                deliveryDayArray[1] = "Monday";
            }
            else if (SkipButton2.BackgroundColor.Equals(green))
            {
                deliveryDayArray[1] = "Skip";
            }

            if (SundayButton3.BackgroundColor.Equals(green))
            {
                deliveryDayArray[2] = "Sunday";
            }
            else if (MondayButton3.BackgroundColor.Equals(green))
            {
                deliveryDayArray[2] = "Monday";
            }

            else if (SkipButton3.BackgroundColor.Equals(green))
            {
                deliveryDayArray[2] = "Skip";
            }

            if (SundayButton4.BackgroundColor.Equals(green))
            {
                deliveryDayArray[3] = "Sunday";
            }
            else if (MondayButton4.BackgroundColor.Equals(green))
            {
                deliveryDayArray[3] = "Monday";
            }
            else if (SkipButton4.BackgroundColor.Equals(green))
            {
                deliveryDayArray[3] = "Skip";
            }

            if (SundayButton5.BackgroundColor.Equals(green))
            {
                deliveryDayArray[4] = "Sunday";
            }
            else if (MondayButton5.BackgroundColor.Equals(green))
            {
                deliveryDayArray[4] = "Monday";
            }
            else if (SkipButton5.BackgroundColor.Equals(green))
            {
                deliveryDayArray[4] = "Skip";
            }

            if (SundayButton6.BackgroundColor.Equals(green))
            {
                deliveryDayArray[5] = "Sunday";
            }
            else if (MondayButton6.BackgroundColor.Equals(green))
            {
                deliveryDayArray[5] = "Monday";
            }
            else if (SkipButton6.BackgroundColor.Equals(green))
            {
                deliveryDayArray[5] = "Skip";
            }
        }

        public void setWeekNum(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            switch (b.ClassId)
            {
                case "SelectButton":
                    weekNumber = 1;
                    break;
                case "SelectButton2":
                    weekNumber = 2;
                    break;
                case "SelectButton3":
                    weekNumber = 3;
                    break;
                case "SelectButton4":
                    weekNumber = 4;
                    break;
                case "SelectButton5":
                    weekNumber = 5;
                    break;
                case "SelectButton6":
                    weekNumber = 6;
                    break;
                case "AddButton":
                    weekNumber = 1;
                    break;
                case "AddButton2":
                    weekNumber = 2;
                    break;
                case "AddButton3":
                    weekNumber = 3;
                    break;
                case "AddButton4":
                    weekNumber = 4;
                    break;
                case "AddButton5":
                    weekNumber = 5;
                    break;
                case "AddButton6":
                    weekNumber = 6;
                    break;
            }
        }

        public int getNum()
        {
            return weekNumber;
        }

        public long getMaxMeals()
        {
            return numMeals;
        }

        public async void postSkipData(object sender, EventArgs e)
        {
            int weekNumber;
            Button b = (Button)sender;
            if (b.ClassId.Equals("SkipButton"))
                weekNumber = 1;
            else if (b.ClassId.Equals("SkipButton2"))
                weekNumber = 2;
            else if (b.ClassId.Equals("SkipButton3"))
                weekNumber = 3;
            else if (b.ClassId.Equals("SkipButton4"))
                weekNumber = 4;
            else if (b.ClassId.Equals("SkipButton5"))
                weekNumber = 5;
            else
                weekNumber = 6;

            HttpClient client = new HttpClient();
            List<DateTimeOffset> weekAffectedList = getWeekList();    // Week Affected Dates            
            string deliveryDay = "SKIP" ;                  // Delivery Days ( 6 of them )
            var dict = new Dictionary<string, int?>();
            dict.Add("",null);

            for(int i = 0; i < weekAffectedList.Count; i++)
            {
                
                System.Diagnostics.Debug.WriteLine("Week Affected: " + weekNumber + " "+ weekAffectedList[i]);
            }

            var mealSelectInfoToSend = new MealSelectInformation
            {
                PurchaseId = "300-000001",                  // Constant for now
                WeekAffected = weekAffectedList[weekNumber - 1],            // Week affected - DONE
                MealQuantities = dict,               // Dictionary inserted - DONE
                DeliveryDay = deliveryDay,               // Day selected - DONE
                DefaultSelected = false,             // Always False unless Surprise - DONE
                IsAddons = false                    // Always False - DONE

            };

            string mealSelectInfoJson = JsonConvert.SerializeObject(mealSelectInfoToSend); // convert to json

            try
            {
                var httpContent = new StringContent(mealSelectInfoJson, Encoding.UTF8, "application/json"); // create a http response to send
                var response = await client.PostAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/mealselection/300-000001", httpContent); // send the json file to database
                if (response.Content != null)
                {
                    var responseContent = await response.Content.ReadAsStringAsync(); // get the success response

                    System.Diagnostics.Debug.WriteLine(responseContent); // print in the logs
                }

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
    }
}