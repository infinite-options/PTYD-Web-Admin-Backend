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

namespace InfiniteMeals.Meals {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealSchedule : ContentPage {
        int ctr = 2;
        bool disabled = false;
        List<String> order = new List<String>();
        public ListView lstView = new ListView { HasUnevenRows = true };
        public Button sundayButton = new Button();
        public IList<Dates> SundayDates { get; private set; }
        public IList<Dates> MondayDates { get; private set; }
        String green = "#8FBC8F";
        String def = "#F5F5F5";


        public MealSchedule() {
            InitializeComponent();


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
            getDates();
            getData();
            BindingContext = this;
        }

        private async void getData()
        {
            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/monday-zip-codes");
            var obj = JsonConvert.DeserializeObject<Data>(content);

            // Get all available zipcodes
            for(int i = 0; i < obj.Result.Res.Length; i++)
            {
                System.Diagnostics.Debug.WriteLine(" monday zip " + obj.Result.Res[i].Zipcode.ToString());
            }

            // Get user zipcodes
            var userZipCodes = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000001");
            var userZipObj = JsonConvert.DeserializeObject<UserInfo>(userZipCodes);
            Boolean zipBool = true;
            for (int i = 0; i < userZipObj.Result.Length; i++)
            {
                System.Diagnostics.Debug.WriteLine(" user zip " + userZipObj.Result[i].MondayAvailable);
                zipBool = userZipObj.Result[i].MondayAvailable;
            }

            zipBool = true;

            if (zipBool == true)
            {
                System.Diagnostics.Debug.WriteLine(" user zip true ");
                MondayButton.IsVisible = true;
                MondayButton2.IsVisible = true;
                MondayButton3.IsVisible = true;
                MondayButton4.IsVisible = true;
                MondayButton5.IsVisible = true;
                MondayButton6.IsVisible = true;
            }

        BindingContext = this;
    }

            public void ClickedColor(object sender, EventArgs e) {
            Button btn = (Button)sender;
            System.Diagnostics.Debug.WriteLine("Class ID" + btn.ClassId + "Disabled? " + disabled + " Ctr " + ctr);


            if (btn.ClassId == "SkipButton") {
                if (btn.BackgroundColor.Equals(Color.FromHex(green)))
                    {
                    btn.BackgroundColor = (Color.FromHex(def));
                    disabled = false;
                    ctr = 0;
                }
                else if (btn.BackgroundColor.Equals(Color.FromHex(def))) {
                    btn.BackgroundColor = Color.FromHex(green);
                    SundayButton.BackgroundColor = Color.FromHex(def);
                    MondayButton.BackgroundColor = Color.FromHex(def);
                    AddonButton.BackgroundColor = Color.FromHex(def);
                    SurpriseButton.BackgroundColor = Color.FromHex(def);
                    SelectButton.BackgroundColor = Color.FromHex(def);
                    disabled = true;
                    ctr = 2;
                }
            }
            else {
                if (disabled == true)
                {
                    if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                    {
                        if (btn.ClassId.Equals("MonButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SundayButton.BackgroundColor = Color.FromHex(def);
                            SkipButton.BackgroundColor = Color.FromHex(def);
                            disabled = false;
                        }
                        else if (btn.ClassId.Equals("SunButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            MondayButton.BackgroundColor = Color.FromHex(def);
                            SkipButton.BackgroundColor = Color.FromHex(def);
                            disabled = false;
                        }
                    }
                }
                else if (disabled == false)
                {
                    if (btn.BackgroundColor.Equals(Color.FromHex(def)))
                    {
                        if (btn.ClassId.Equals("MonButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SundayButton.BackgroundColor = Color.FromHex(def);

                        }
                        else if (btn.ClassId.Equals("SunButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            MondayButton.BackgroundColor = Color.FromHex(def);
                        }

                        if (btn.ClassId.Equals("SelectButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SurpriseButton.BackgroundColor = Color.FromHex(def);
                        }
                        else if (btn.ClassId.Equals("SurpriseButton"))
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            SelectButton.BackgroundColor = Color.FromHex(def);
                        }
                        else
                        {
                            btn.BackgroundColor = Color.FromHex(green);
                            order.Add(btn.Text);
                            ctr--;
                        }
                    }
                    else
                    {
                        btn.BackgroundColor = (Color.FromHex(def));
                        order.Remove(btn.Text);
                        ctr++;
                    }
                }
            }
        }

        private async void ClickedStepper(object sender, EventArgs e) {
            await Navigation.PushAsync(new Steppers.BasicSteppers());
        }

        private async void ClickedAddOn(object sender, EventArgs e)
        {
            // Change button colors

            Button btn = (Button)sender;

            if (btn.BackgroundColor.Equals(Color.FromHex(def)) &&
                SkipButton.BackgroundColor.Equals(Color.FromHex(def)))
            {
                btn.BackgroundColor = Color.FromHex("#F9E29C");
                await Navigation.PushAsync(new MealSelect.AddOnChoices());
                //await Navigation.PushAsync(new MealSelect.MealChoices());
            }
            else
            {
                btn.BackgroundColor = (Color.FromHex(def));
            }
        }

        private async void ClickedAddOnNav(object sender, EventArgs e)
        {
            ClickedAddOn(sender, e);
            await Navigation.PushAsync(new MealSelect.AddOnChoices());
        }

        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            ClickedColor(sender, e);
            if (SundayButton.BackgroundColor.Equals(Color.FromHex(green)) | MondayButton.BackgroundColor.Equals(Color.FromHex(green)))
                await Navigation.PushAsync(new MealSelect.MealChoices());
        }

        public void getDates()
        {
            // If today is sunday, monday, tuesday, wednesday -> this week
            // If today is thursday, friday, saturday -> next week
            // Today's Date
            DateTime dateValue = DateTime.Now;
            DateTime firstSun, firstMon;
            String dateText = dateValue.ToString("dddd");
            List<String> AllSundays = new List<String>();
            List<String> AllMondays = new List<String>();
            switch (dateText)
            {
                case "Sunday":
                    for(int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays((7 * (i + 1)))));
                        System.Diagnostics.Debug.WriteLine("Dates: " + AllSundays[i] + " " + AllMondays[i]);
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
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(6)));
                    firstSun = dateValue.AddDays(6);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Dates: " + AllSundays[i] + AllMondays[i]);
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
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(5)));
                    firstSun = dateValue.AddDays(5);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Sunday: " + AllSundays[i] + " Monday: " + AllMondays[i]);
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
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(4)));
                    firstSun = dateValue.AddDays(4);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Sunday: " + AllSundays[i] + " Monday: " + AllMondays[i]);
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
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(10)));
                    firstSun = dateValue.AddDays(10);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Sunday: " + AllSundays[i] + " Monday: " + AllMondays[i]);
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
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(9)));
                    firstSun = dateValue.AddDays(9);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Sunday: " + AllSundays[i] + " Monday: " + AllMondays[i]);
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
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(8)));
                    firstSun = dateValue.AddDays(8);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Sunday: " + AllSundays[i] + " Monday: " + AllMondays[i]);
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
    }
}