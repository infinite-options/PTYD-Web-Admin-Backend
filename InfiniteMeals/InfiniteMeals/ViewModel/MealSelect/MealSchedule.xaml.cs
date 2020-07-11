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
using Xamarin.Forms.Internals;

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
        public static string green = "#FF8FBC8F";
        public static string def = "#FFF5F5F5";
        public static string yellow = "#FFE573";
        public static string subscriptionLabel = "Your Subscriptions";
        private static long numMeals;
        private List<string> allSubscriptions = new List<string>();
        private List<long> maxMealsList = new List<long>();
        private string acctUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000001";
        private string mealUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/mealselection/300-000002";
        private static Dictionary<string, Dictionary<string, string>> savedMenu = new Dictionary<string, Dictionary<string, string>>();
        private static Dictionary<string, string> save = new Dictionary<string, string>();
        private static Dictionary<string, string> values = new Dictionary<string, string>();
        private List<string> AllSundays = new List<string>();
        private List<String> AllSaturdays = new List<String>();
        private List<String> AllMondays = new List<String>();
        public static List<MealScheduleSaves.MealScheduleSavedColors> mss = new List<MealScheduleSaves.MealScheduleSavedColors>();

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
            getDates();
            subscriptionPicker();
            getPosted();

            BindingContext = this;
        }

        private void getData()
        {
            nullPicker.SetValue(IsVisibleProperty, false);
            WebClient client = new WebClient();

            // Get user zipcodes
            var userZipCodes = client.DownloadString(acctUrl);
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

            var userZipCodes = client.DownloadString(acctUrl);
            // Get subscription plans
            var subPlansObj = JsonConvert.DeserializeObject<UserInformation>(userZipCodes);

            for (int subNum = 0; subNum < subPlansObj.Result.Length; subNum++)
            {
                if (subPlansObj.Result[subNum].BuyerId == "100-000001")
                {
                    allSubscriptions.Add(subPlansObj.Result[subNum].MealPlanDesc);
                    maxMealsList.Add(subPlansObj.Result[subNum].MaximumMeals);
                    SubscriptionPicker.Items.Add(allSubscriptions[subNum]);
                }
            }
            SubscriptionPicker.SelectedIndex = 0;
            BindingContext = this;
        }

        private void SubscriptionPicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            Picker p = (Picker)sender;
            nullPicker.SetValue(IsVisibleProperty, false);
            SubscriptionPicker.Title = subscriptionLabel;
            numMeals = maxMealsList[SubscriptionPicker.SelectedIndex];
            HeaderLabel.Text = allSubscriptions[SubscriptionPicker.SelectedIndex];

            /*
            for(int i = 0; i < mss.Count; i++)
            {
                if(mss.Any(a => a.planName.Equals( SubscriptionPicker.SelectedItem.ToString())))
                {
                    if (mss[i].planName.Equals(p.SelectedItem.ToString()))
                    {
                        System.Diagnostics.Debug.WriteLine("If Statement" + mss[i].planName + " " + p.SelectedItem.ToString());
                        foreach (var dictVals in mss[i].controlColor)
                        {
                            foreach (var controls in ButtonStack.Children)
                            {
                                if (controls.ClassId.Equals(dictVals.Key))
                                {
                                    System.Diagnostics.Debug.WriteLine("SETTING CONTROLS" + p.SelectedItem.ToString() +
                                        " " + controls.ClassId + " " + dictVals.Key + " " + dictVals.Value);
                                    controls.BackgroundColor = Color.FromHex(dictVals.Value);
                                }
                            }
                        }
                    }
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("RESET");
                    reset();
                }


            }*/
            /*
            else
            {
                System.Diagnostics.Debug.WriteLine("RESET");
                reset();
            }

            getPosted();
            */
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
                if (b.ClassId.Equals("SurpriseButton"))
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
                //postSurpriseData(sender, e);

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
                            //postSkipData(sender, e);
                            saveColors(SubscriptionPicker);
                            break;
                        case "SkipButton2":
                            SundayButton2.BackgroundColor = Color.FromHex(def);
                            MondayButton2.BackgroundColor = Color.FromHex(def);
                            AddonButton2.BackgroundColor = Color.FromHex(def);
                            SurpriseButton2.BackgroundColor = Color.FromHex(def);
                            SelectButton2.BackgroundColor = Color.FromHex(def);
                            disabled = true;
                            setWeekNum(sender, e);
                            //postSkipData(sender, e);
                            saveColors(SubscriptionPicker);
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
                            //postSkipData(sender, e);
                            saveColors(SubscriptionPicker);
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
                            //postSkipData(sender, e);
                            saveColors(SubscriptionPicker);
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
                            //postSkipData(sender, e);
                            saveColors(SubscriptionPicker);
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
                            //postSkipData(sender, e);
                            saveColors(SubscriptionPicker);
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
                                saveColors(SubscriptionPicker);
                                break;
                            case "MonButton2":
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton2.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[1] = "Monday";
                                saveColors(SubscriptionPicker);
                                break;
                            case "MonButton3":
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton3.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[2] = "Monday";
                                saveColors(SubscriptionPicker);
                                break;
                            case "MonButton4":
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton4.BackgroundColor = Color.FromHex(def);
                                deliveryDayArray[3] = "Monday";
                                saveColors(SubscriptionPicker);
                                break;
                            case "MonButton5":
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                SundayButton5.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

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
                                saveColors(SubscriptionPicker);

                                deliveryDayArray[0] = "Sunday";
                                break;
                            case "SunButton2":
                                SkipButton2.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton2.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                deliveryDayArray[1] = "Sunday";
                                break;
                            case "SunButton3":
                                SkipButton3.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton3.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                deliveryDayArray[2] = "Sunday";

                                break;
                            case "SunButton4":
                                SkipButton4.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton4.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                deliveryDayArray[3] = "Sunday";
                                break;
                            case "SunButton5":
                                SkipButton5.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton5.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                deliveryDayArray[4] = "Sunday";
                                break;
                            case "SunButton6":
                                SkipButton6.BackgroundColor = Color.FromHex(def);
                                btn.BackgroundColor = Color.FromHex(green);
                                MondayButton6.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                deliveryDayArray[5] = "Sunday";
                                break;
                            case "SelectButton":
                                SurpriseButton.BackgroundColor = Color.FromHex(def);
                                weekNumber = 1;
                                setWeekNum(sender, e);
                                saveColors(SubscriptionPicker);

                                break;
                            case "SelectButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton2.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                weekNumber = 2;
                                setWeekNum(sender, e);
                                break;
                            case "SelectButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton3.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                setWeekNum(sender, e);
                                break;
                            case "SelectButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton4.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                setWeekNum(sender, e);
                                break;
                            case "SelectButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton5.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

                                setWeekNum(sender, e);
                                break;
                            case "SelectButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton6.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);

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
            switch (dateText)
            {
                /*
                case "Sunday":
                    firstSat = dateValue.AddDays(6);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(7 * (i + 1))));
                        weekAffectedList.Add(dateValue.AddDays(7 * (i + 1)));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays((7 * (i + 1)) + 1)));
                    }
                    for(int i = 0; i < 5; i++)
                    {
                        AllSaturdays.Add(firstSat.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
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
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                         AllSaturdays.Add((firstSat.AddDays(7 * (i + 1))).ToString("M/dd/yyyy"));

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
                    firstSat = dateValue.AddDays(4);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(5)));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

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
                        AllSaturdays.Add((firstSat.AddDays(7 * (i + 1))).ToString("M/dd/yyyy"));

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
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));
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
                        AllSaturdays.Add((firstSat.AddDays(7 * (i + 1))).ToString("M/dd/yyyy"));
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
                    //AllSundays.Add((dateValue.AddDays(10)).ToString("M/dd/yyyy"));

                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

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
                        AllSaturdays.Add((firstSat.AddDays(7 * (i + 1))).ToString("M/dd/yyyy"));
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
                */
                case "Friday":
                    firstSat = dateValue.AddDays(8);
                    AllSundays.Add(dateValue.AddDays(9).ToString("M/dd/yyyy"));
                    //AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(9)));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    firstSun = dateValue.AddDays(9);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));

                        //AllSundays.Add(String.Format("{0:dddd MMMM d}", firstSun.AddDays(7 * (i + 1))));
                        //AllMondays.Add(String.Format("{0:dddd MMMM d}", firstMon.AddDays(7 * i)));
                    }
                    for (int i = 0; i < 5; i++)
                    {
                        weekAffectedList.Add(firstSat.AddDays(7 * (i + 1)));
                        AllSaturdays.Add((firstSat.AddDays(7 * (i + 1))).ToString("M/dd/yyyy"));

                    }
                    SundayButton.Text = DateTimeOffset.Parse(AllSundays[0]).ToString("M/dd/yyyy");
                    SundayButton2.Text = DateTimeOffset.Parse(AllSundays[1]).ToString("M/dd/yyyy");
                    SundayButton3.Text = DateTimeOffset.Parse(AllSundays[2]).ToString("M/dd/yyyy");
                    SundayButton4.Text = DateTimeOffset.Parse(AllSundays[3]).ToString("M/dd/yyyy");
                    SundayButton5.Text = DateTimeOffset.Parse(AllSundays[4]).ToString("M/dd/yyyy");
                    SundayButton6.Text = DateTimeOffset.Parse(AllSundays[5]).ToString("M/dd/yyyy");
                    MondayButton.Text = DateTimeOffset.Parse(AllMondays[0]).ToString("M/dd/yyyy");
                    MondayButton2.Text = DateTimeOffset.Parse(AllMondays[1]).ToString("M/dd/yyyy");
                    MondayButton3.Text = DateTimeOffset.Parse(AllMondays[2]).ToString("M/dd/yyyy");
                    MondayButton4.Text = DateTimeOffset.Parse(AllMondays[3]).ToString("M/dd/yyyy");
                    MondayButton5.Text = DateTimeOffset.Parse(AllMondays[4]).ToString("M/dd/yyyy");
                    MondayButton6.Text = DateTimeOffset.Parse(AllMondays[5]).ToString("M/dd/yyyy");

                    /*
                    SundayButton.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllSundays[0])));
                    SundayButton2.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllSundays[1])));
                    SundayButton3.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllSundays[2])));
                    SundayButton4.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllSundays[3])));
                    SundayButton5.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllSundays[4])));
                    SundayButton6.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllSundays[5])));
                    MondayButton.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllMondays[0])));
                    MondayButton2.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllMondays[1])));
                    MondayButton3.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllMondays[2])));
                    MondayButton4.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllMondays[3])));
                    MondayButton5.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllMondays[4])));
                    MondayButton6.Text = String.Format("{0:dddd MMMM d}", (DateTimeOffset.Parse(AllMondays[5])));
                    */
                    /*SundayButton.Text = String.Format("{0:dddd MMMM d}",(DateTimeOffset.Parse(AllSundays[0])));
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
                    */
                    break;
                    /*
                case "Saturday":
                    firstSat = dateValue.AddDays(7);
                    AllSundays.Add(String.Format("{0:dddd MMMM d}", dateValue.AddDays(8)));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("MM/dd/yyyy"));
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
                        AllSaturdays.Add((firstSat.AddDays(7 * (i + 1))).ToString("M/dd/yyyy"));

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
                    */
            }
        }

        public List<String> getPurchID()
        {
            WebClient client = new WebClient();

            // Get user zipcodes
            var userPurchClient = client.DownloadString(acctUrl);
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
                var response = await client.PostAsync(mealUrl, httpContent); // send the json file to database
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

        public async void postSurpriseData(object sender, EventArgs e)
        {
            int weekNumber;
            Button b = (Button)sender;
            if (b.ClassId.Equals("SurpriseButton"))
                weekNumber = 1;
            else if (b.ClassId.Equals("SurpriseButton2"))
                weekNumber = 2;
            else if (b.ClassId.Equals("SurpriseButton3"))
                weekNumber = 3;
            else if (b.ClassId.Equals("SurpriseButton4"))
                weekNumber = 4;
            else if (b.ClassId.Equals("SurpriseButton5"))
                weekNumber = 5;
            else
                weekNumber = 6;

            HttpClient client = new HttpClient();
            List<DateTimeOffset> weekAffectedList = getWeekList();    // Week Affected Dates            
            string deliveryDay = deliveryDayArray[weekNumber - 1];                  // Delivery Days ( 6 of them )
            var dict = new Dictionary<string, int?>();
            dict.Add("", null);

            for (int i = 0; i < weekAffectedList.Count; i++)
            {

                System.Diagnostics.Debug.WriteLine("Week Affected: " + weekNumber + " " + weekAffectedList[i]);
            }

            var mealSelectInfoToSend = new MealSelectInformation
            {
                PurchaseId = "300-000001",                  // Constant for now
                WeekAffected = weekAffectedList[weekNumber - 1],            // Week affected - DONE
                MealQuantities = dict,               // Dictionary inserted - DONE
                DeliveryDay = deliveryDay,               // Day selected - DONE
                DefaultSelected = true,             // Always False unless Surprise - DONE
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

        public void saveColors(object sender)
        {
            Picker chosenSubscription = (Picker)sender;

            foreach (var ctrl in ButtonStack.Children)
            {
                if (save.ContainsKey(ctrl.ClassId))
                {
                    save.Remove(ctrl.ClassId);
                }
                save.Add(ctrl.ClassId, ctrl.BackgroundColor.ToHex().ToString());

                if (savedMenu.ContainsKey(chosenSubscription.SelectedItem.ToString()))
                {
                    savedMenu.Remove(chosenSubscription.SelectedItem.ToString());
                }
                savedMenu.Add(chosenSubscription.SelectedItem.ToString(), save);
            }

            bool contains = mss.Any(f => f.planName.Equals(chosenSubscription.SelectedItem.ToString()));
            if(contains)
            {
                mss.RemoveAll(f => f.planName.Equals(chosenSubscription.SelectedItem.ToString()));
            }
            mss.Add(new MealScheduleSaves.MealScheduleSavedColors
            {
                planName = chosenSubscription.SelectedItem.ToString(),
                controlColor = save,
            });

            for (int i = 0; i < mss.Count; i ++)
            {
                System.Diagnostics.Debug.WriteLine("MSS: " + mss[i].planName + mss[i].controlColor);
                foreach (var item in mss[i].controlColor)
                {
                    System.Diagnostics.Debug.WriteLine("ControlCOlor: " + item.Key + " " + item.Value);

                }

            }

            for(int i = 0; i < mss.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine("All MSS: " + mss[i].planName + mss[i].controlColor);
                foreach(var pk in mss[i].controlColor)
                {
                    System.Diagnostics.Debug.WriteLine("All MSS: " + mss[i].planName + " " + pk.Key + " " + pk.Value );

                }
            }
        }

        public void reset()
        {
            SundayButton.BackgroundColor = Color.FromHex(green);
            SundayButton2.BackgroundColor = Color.FromHex(green);
            SundayButton3.BackgroundColor = Color.FromHex(green);
            SundayButton4.BackgroundColor = Color.FromHex(green);
            SundayButton5.BackgroundColor = Color.FromHex(green);
            SurpriseButton6.BackgroundColor = Color.FromHex(green);
            SurpriseButton.BackgroundColor = Color.FromHex(green);
            SurpriseButton2.BackgroundColor = Color.FromHex(green);
            SurpriseButton3.BackgroundColor = Color.FromHex(green);
            SurpriseButton4.BackgroundColor = Color.FromHex(green);
            SurpriseButton5.BackgroundColor = Color.FromHex(green);
            SurpriseButton6.BackgroundColor = Color.FromHex(green);
            AddonButton.BackgroundColor = Color.FromHex(def);
            AddonButton2.BackgroundColor = Color.FromHex(def);
            AddonButton3.BackgroundColor = Color.FromHex(def);
            AddonButton4.BackgroundColor = Color.FromHex(def);
            AddonButton5.BackgroundColor = Color.FromHex(def);
            AddonButton6.BackgroundColor = Color.FromHex(def);
            SkipButton.BackgroundColor = Color.FromHex(def);
            SkipButton2.BackgroundColor = Color.FromHex(def);
            SkipButton3.BackgroundColor = Color.FromHex(def);
            SkipButton4.BackgroundColor = Color.FromHex(def);
            SkipButton5.BackgroundColor = Color.FromHex(def);
            SkipButton6.BackgroundColor = Color.FromHex(def);
            MondayButton.BackgroundColor = Color.FromHex(def);
            MondayButton2.BackgroundColor = Color.FromHex(def);
            MondayButton3.BackgroundColor = Color.FromHex(def);
            MondayButton4.BackgroundColor = Color.FromHex(def);
            MondayButton5.BackgroundColor = Color.FromHex(def);
            MondayButton6.BackgroundColor = Color.FromHex(def);
            SelectButton.BackgroundColor = Color.FromHex(def);
            SelectButton2.BackgroundColor = Color.FromHex(def);
            SelectButton3.BackgroundColor = Color.FromHex(def);
            SelectButton4.BackgroundColor = Color.FromHex(def);
            SelectButton5.BackgroundColor = Color.FromHex(def);
            SelectButton6.BackgroundColor = Color.FromHex(def);

        }

        public Picker getThePicker()
        {
            return this.SubscriptionPicker;
        }

        public void getPosted()
        {
            WebClient client = new WebClient();
            var mealString = client.DownloadString(mealUrl);
            var mealObj = JsonConvert.DeserializeObject<GetPostedMeals>(mealString);
            List<string> newWeekAffected = new List<string>();  // WEEK AFFECTED LIST WITHOUT TIME M/DD/YYY
            List<string> JsonWAList = new List<string>();       // WEEK AFFECTED LIST FROM JSON M/DD/YYYY


            foreach (var week in weekAffectedList)
            {
               newWeekAffected.Add(week.ToString("M/dd/yyyy"));
            }
            for (int i = 0; i < mealObj.Result.Meals.Length; i++)
            {
                JsonWAList.Add(mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy"));
            }


            // If the weeks are not selected already
            for (int i = 0; i < newWeekAffected.Count; i++)
            {
                if (!JsonWAList.Contains(newWeekAffected[i]))
                {
                    if (i == 0)
                    {
                        SundayButton.BackgroundColor = Color.FromHex(green);
                        SurpriseButton.BackgroundColor = Color.FromHex(green);
                    }
                    else if (i == 1)
                    {
                        SundayButton2.BackgroundColor = Color.FromHex(green);
                        SurpriseButton2.BackgroundColor = Color.FromHex(green);
                    }
                    else if (i == 2)
                    {
                        SundayButton3.BackgroundColor = Color.FromHex(green);
                        SurpriseButton3.BackgroundColor = Color.FromHex(green);
                    }
                    else if (i == 3)
                    {
                        SundayButton4.BackgroundColor = Color.FromHex(green);
                        SurpriseButton4.BackgroundColor = Color.FromHex(green);
                    }
                    else if (i == 4)
                    {
                        SundayButton5.BackgroundColor = Color.FromHex(green);
                        SurpriseButton5.BackgroundColor = Color.FromHex(green);
                    }
                    else if (i == 5)
                    {
                        SundayButton6.BackgroundColor = Color.FromHex(green);
                        SurpriseButton6.BackgroundColor = Color.FromHex(green);
                    }
                }
            }

            // If the weeks are already selected
            for (int i = 0; i < JsonWAList.Count; i++)
            {
                int index = JsonWAList.IndexOf(mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy"));

                if (mealObj.Result.Meals[i].DeliveryDay.Equals("Sunday"))
                {
                    foreach(Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy");
                        var item = newWeekAffected.IndexOf(hi);
                        if (vare.Text.Equals(mealObj.Result.Meals[i].WeekAffected.AddDays(1).ToString("M/dd/yyyy")))
                        {
                            vare.BackgroundColor = Color.FromHex(green);
                            if (item == 0) SelectButton.BackgroundColor = Color.FromHex(green);
                            else if (item == 1) SelectButton2.BackgroundColor = Color.FromHex(green);
                            else if (item == 2) SelectButton3.BackgroundColor = Color.FromHex(green);
                            else if (item == 3) SelectButton4.BackgroundColor = Color.FromHex(green);
                            else if (item == 4) SelectButton5.BackgroundColor = Color.FromHex(green);
                            else if (item == 5) SelectButton6.BackgroundColor = Color.FromHex(green);
                        }
                    }
                }
                else if(mealObj.Result.Meals[i].DeliveryDay.Equals("Monday"))
                {
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy");
                        var item = newWeekAffected.IndexOf(hi);
                        if (vare.Text.Equals(mealObj.Result.Meals[i].WeekAffected.AddDays(2).ToString("M/dd/yyyy")))
                        {
                            vare.BackgroundColor = Color.FromHex(green);
                            if (item == 0) SelectButton.BackgroundColor = Color.FromHex(green);
                            else if (item == 1) SelectButton2.BackgroundColor = Color.FromHex(green);
                            else if (item == 2) SelectButton3.BackgroundColor = Color.FromHex(green);
                            else if (item == 3) SelectButton4.BackgroundColor = Color.FromHex(green);
                            else if (item == 4) SelectButton5.BackgroundColor = Color.FromHex(green);
                            else if (item == 5) SelectButton6.BackgroundColor = Color.FromHex(green);
                        }
                    }
                }
                else if (mealObj.Result.Meals[i].DeliveryDay.Equals("SKIP"))
                {
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy");
                        var item = newWeekAffected.IndexOf(hi);

                        if(item == 0)
                        {
                            SkipButton.BackgroundColor = Color.FromHex(green);
                        }
                        if (item == 1)
                        {
                            SkipButton2.BackgroundColor = Color.FromHex(green);
                        }
                        if (item == 2)
                        {
                            SkipButton3.BackgroundColor = Color.FromHex(green);
                        }
                        if (item == 3)
                        {
                            SkipButton4.BackgroundColor = Color.FromHex(green);
                        }
                        if (item == 4)
                        {
                            SkipButton5.BackgroundColor = Color.FromHex(green);
                        }
                        if (item == 5)
                        {
                            SkipButton6.BackgroundColor = Color.FromHex(green);
                        }
                    }
                }

                if(mealObj.Result.Addons[i].WeekAffected != null)
                {
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Addons[i].WeekAffected.ToString("M/dd/yyyy");

                        if(newWeekAffected.Contains(hi))
                        {
                            var item = newWeekAffected.IndexOf(hi);
                            if(item == 0)
                            {
                                AddonButton.BackgroundColor = Color.FromHex(yellow);
                            }
                            else if(item == 1)
                            {
                                AddonButton2.BackgroundColor = Color.FromHex(yellow);

                            }
                            else if (item == 2)
                            {
                                AddonButton3.BackgroundColor = Color.FromHex(yellow);

                            }
                            else if (item == 3)
                            {
                                AddonButton4.BackgroundColor = Color.FromHex(yellow);

                            }
                            else if (item == 4)
                            {
                                AddonButton5.BackgroundColor = Color.FromHex(yellow);

                            }
                            else if (item == 5)
                            {
                                AddonButton6.BackgroundColor = Color.FromHex(yellow);

                            }
                        }

                    }
                }
            }
        }          
    }
}