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
    public partial class MealSchedule : ContentPage
    {
        int ctr = 2;
        bool disabled = false;
        List<String> order = new List<String>();
        public ListView lstView = new ListView { HasUnevenRows = true };
        public Button sundayButton = new Button();
        public IList<Dates> SundayDates { get; private set; }
        public IList<Dates> MondayDates { get; private set; }
        public List<String> purchaseIdList = new List<String>();
        public List<DateTimeOffset> weekAffectedList = new List<DateTimeOffset>();
        public string[] deliveryDayArray = { "Sunday", "Sunday", "Sunday", "Sunday", "Sunday", "Sunday" };
        String green = "#8FBC8F";
        String def = "#F5F5F5";


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
            getDates();
            getData();
            BindingContext = this;
        }

        private async void getData()
        {

        HttpClient client = new HttpClient();

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
                            deliveryDayArray[0] = "SKIP";
                            System.Diagnostics.Debug.WriteLine("now here " + deliveryDayArray[0]);
                            ctr = 2;
                            break;
                        case "SkipButton2":
                            SundayButton2.BackgroundColor = Color.FromHex(def);
                            MondayButton2.BackgroundColor = Color.FromHex(def);
                            AddonButton2.BackgroundColor = Color.FromHex(def);
                            SurpriseButton2.BackgroundColor = Color.FromHex(def);
                            SelectButton2.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            deliveryDayArray[1] = "SKIP";
                            System.Diagnostics.Debug.WriteLine("now here " + deliveryDayArray[1]);
                            ctr = 2;
                            break;
                        case "SkipButton3":
                            SundayButton3.BackgroundColor = Color.FromHex(def);
                            MondayButton3.BackgroundColor = Color.FromHex(def);
                            AddonButton3.BackgroundColor = Color.FromHex(def);
                            SurpriseButton3.BackgroundColor = Color.FromHex(def);
                            SelectButton3.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            deliveryDayArray[2] = "SKIP";
                            ctr = 2;
                            break;
                        case "SkipButton4":
                            SundayButton4.BackgroundColor = Color.FromHex(def);
                            MondayButton4.BackgroundColor = Color.FromHex(def);
                            AddonButton4.BackgroundColor = Color.FromHex(def);
                            SurpriseButton4.BackgroundColor = Color.FromHex(def);
                            SelectButton4.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            deliveryDayArray[3] = "SKIP";
                            ctr = 2;
                            break;
                        case "SkipButton5":
                            SundayButton5.BackgroundColor = Color.FromHex(def);
                            MondayButton5.BackgroundColor = Color.FromHex(def);
                            AddonButton5.BackgroundColor = Color.FromHex(def);
                            SurpriseButton5.BackgroundColor = Color.FromHex(def);
                            SelectButton5.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            deliveryDayArray[4] = "SKIP";
                            ctr = 2;
                            break;
                        case "SkipButton6":
                            SundayButton6.BackgroundColor = Color.FromHex(def);
                            MondayButton6.BackgroundColor = Color.FromHex(def);
                            AddonButton6.BackgroundColor = Color.FromHex(def);
                            SurpriseButton6.BackgroundColor = Color.FromHex(def);
                            SelectButton6.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            deliveryDayArray[5] = "SKIP";
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
                                deliveryDayArray[0] = "Monday";
                                System.Diagnostics.Debug.WriteLine("now here " + deliveryDayArray[0]);
                                disabled = false;
                                break;
                            case "MonButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton2.BackgroundColor = Color.FromHex(def);
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Monday";
                                disabled = false;
                                break;
                            case "MonButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton3.BackgroundColor = Color.FromHex(def);
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Monday";
                                disabled = false;
                                break;
                            case "MonButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton4.BackgroundColor = Color.FromHex(def);
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Monday";
                                disabled = false;
                                break;
                            case "MonButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton5.BackgroundColor = Color.FromHex(def);
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[4] = "Monday";
                                disabled = false;
                                break;
                            case "MonButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton6.BackgroundColor = Color.FromHex(def);
                                SkipButton6.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[5] = "Monday";
                                disabled = false;
                                break;
                            case "SunButton":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton.BackgroundColor = Color.FromHex(def);
                                SkipButton.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[0] = "Sunday";
                                System.Diagnostics.Debug.WriteLine("now here " + deliveryDayArray[0]);
                                disabled = false;
                                break;
                            case "SunButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton2.BackgroundColor = Color.FromHex(def);
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Sunday";
                                disabled = false;
                                break;
                            case "SunButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton3.BackgroundColor = Color.FromHex(def);
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Sunday";
                                disabled = false;
                                break;
                            case "SunButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton4.BackgroundColor = Color.FromHex(def);
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Sunday";
                                disabled = false;
                                break;
                            case "SunButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton5.BackgroundColor = Color.FromHex(def);
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[4] = "Sunday";
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
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[0] = "Monday";
                                System.Diagnostics.Debug.WriteLine("now here " + deliveryDayArray[0]);

                                break;
                            case "MonButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Monday";
                                break;
                            case "MonButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Monday";
                                break;
                            case "MonButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Monday";
                                break;
                            case "MonButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton5.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[4] = "Monday";
                                break;
                            case "MonButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton6.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[5] = "Monday";
                                break;
                            case "SunButton":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[0] = "Sunday";
                                break;
                            case "SunButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Sunday";
                                break;
                            case "SunButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Sunday";

                                break;
                            case "SunButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Sunday";
                                break;
                            case "SunButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton5.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[4] = "Sunday";
                                break;
                            case "SunButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton6.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[5] = "Sunday";
                                break;
                            case "SelectButton":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton.BackgroundColor = Color.FromHex(def);
                                getWeekNum(sender, e);
                                break;
                            case "SelectButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton2.BackgroundColor = Color.FromHex(def);
                                getWeekNum(sender, e);
                                break;
                            case "SelectButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton3.BackgroundColor = Color.FromHex(def);
                                getWeekNum(sender, e);
                                break;
                            case "SelectButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton4.BackgroundColor = Color.FromHex(def);
                                getWeekNum(sender, e);
                                break;
                            case "SelectButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton5.BackgroundColor = Color.FromHex(def);
                                getWeekNum(sender, e);
                                break;
                            case "SelectButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton6.BackgroundColor = Color.FromHex(def);
                                getWeekNum(sender, e);
                                break;
                            case "SurpriseButton":
                                btn.BackgroundColor = Color.FromHex(green);
                                SelectButton.BackgroundColor = Color.FromHex(def);
                                break;
                            case "SurpriseButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SelectButton2.BackgroundColor = Color.FromHex(def);
                                break;
                            case "SurpriseButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SelectButton3.BackgroundColor = Color.FromHex(def);
                                break;
                            case "SurpriseButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SelectButton4.BackgroundColor = Color.FromHex(def);
                                break;
                            case "SurpriseButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SelectButton5.BackgroundColor = Color.FromHex(def);
                                break;
                            case "SurpriseButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SelectButton6.BackgroundColor = Color.FromHex(def);
                                break;
                            default:
                                btn.BackgroundColor = Color.FromHex(green);
                                order.Add(btn.Text);
                                ctr--;
                                break;
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
            setDDArr();

            for(int i = 0; i < deliveryDayArray.Length; i++)
            {
                System.Diagnostics.Debug.WriteLine("Dates: " + deliveryDayArray[i]);
            }

        }

        private async void ClickedAddOn(object sender, EventArgs e)
        { 

            Button btn = (Button) sender;

            if (btn.BackgroundColor.Equals(Color.FromHex(def)) &&
                SkipButton.BackgroundColor.Equals(Color.FromHex(def)))
            {
                btn.BackgroundColor = Color.FromHex("#F9E29C");
                await Navigation.PushAsync(new MealSelect.AddOnChoices());
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
            if (SundayButton.BackgroundColor.Equals(Color.FromHex(green)) |
                MondayButton.BackgroundColor.Equals(Color.FromHex(green)) |
                SundayButton2.BackgroundColor.Equals(Color.FromHex(green)) |
                MondayButton2.BackgroundColor.Equals(Color.FromHex(green)) |
                SundayButton3.BackgroundColor.Equals(Color.FromHex(green)) |
                MondayButton3.BackgroundColor.Equals(Color.FromHex(green)) |
                SundayButton4.BackgroundColor.Equals(Color.FromHex(green)) |
                MondayButton4.BackgroundColor.Equals(Color.FromHex(green)) |
                SundayButton5.BackgroundColor.Equals(Color.FromHex(green)) |
                MondayButton5.BackgroundColor.Equals(Color.FromHex(green)) |
                SundayButton6.BackgroundColor.Equals(Color.FromHex(green)) |
                MondayButton6.BackgroundColor.Equals(Color.FromHex(green)))

                setDDArr();
            await Navigation.PushAsync(new MealSelect.MealChoices());
        }


        public void getDates()
        {
            // If today is sunday, monday, tuesday, wednesday -> this week
            // If today is thursday, friday, saturday -> next week
            // Today's Date
            DateTimeOffset dateValue = DateTimeOffset.Now;
            DateTimeOffset firstSun, firstMon;
            String dateText = dateValue.ToString("dddd");
            List<String> AllSundays = new List<String>();
            List<String> AllMondays = new List<String>();
            switch (dateText)
            {
                case "Sunday":
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(7 * (i + 1))));
                        weekAffectedList.Add(dateValue.AddDays(7 * (i + 1)));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays((7 * (i + 1)) + 1)));
                        System.Diagnostics.Debug.WriteLine("Dates: " + weekAffectedList[i]);

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
                    weekAffectedList.Add(dateValue.AddDays(6));

                    firstSun = dateValue.AddDays(6);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                        System.Diagnostics.Debug.WriteLine("Dates: " + AllSundays[i] + AllMondays[i]);
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSun.AddDays(7 * (i + 1)));
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
                    weekAffectedList.Add(dateValue.AddDays(5));

                    firstSun = dateValue.AddDays(5);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSun.AddDays(7 * (i + 1)));
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
                    weekAffectedList.Add(dateValue.AddDays(4));

                    firstSun = dateValue.AddDays(4);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSun.AddDays(7 * (i + 1)));
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
                    weekAffectedList.Add(dateValue.AddDays(10));

                    firstSun = dateValue.AddDays(10);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSun.AddDays(7 * (i + 1)));
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
                    weekAffectedList.Add(dateValue.AddDays(9));

                    firstSun = dateValue.AddDays(9);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSun.AddDays(7 * (i + 1)));
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
                    weekAffectedList.Add(dateValue.AddDays(8));

                    firstSun = dateValue.AddDays(8);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSun.AddDays(7 * (i + 1)));
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

        public async Task<List<String>> getPurchID()
        {
            HttpClient client = new HttpClient();

            // Get user zipcodes
            var userPurchClient = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000001");
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

        public int getWeekNum(object sender, EventArgs e)
        {
            int weekNumber = 0;
            Button b = sender as Button;
            System.Diagnostics.Debug.WriteLine("Dates: " + b.ClassId);
            switch (b.ClassId)
            {
                case "SelectButton":
                    weekNumber = 1;
                    break;
                case "SelectButton2":
                    weekNumber = 2;
                    break;
                case "SelectButto3":
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
            }
            return weekNumber;
        }

    }
}