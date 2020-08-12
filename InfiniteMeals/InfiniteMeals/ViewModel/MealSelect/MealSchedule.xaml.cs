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
using InfiniteMeals.ViewModel.MealSelect;
using System.Runtime.Serialization;
using InfiniteMeals.Model.Meals;
using Xamarin.Forms.Internals;

namespace InfiniteMeals.ViewModel.MealSelect
{

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealSchedule : ContentPage
    {
        int ctr = 2;
        public int weekNumber;
        private bool disabled = false;
        public ListView lstView = new ListView { HasUnevenRows = true };
        public Button sundayButton = new Button();
        public List<String> purchaseIdList = new List<String>();
        private List<DateTimeOffset> weekAffectedList = new List<DateTimeOffset>();
        private string[] deliveryDayArray = { "Sunday", "Sunday", "Sunday", "Sunday", "Sunday", "Sunday" };
        public static string green = "#FF8FBC8F";
        public static string def = "#FFF5F5F5";
        public static string yellow = "#FFE573";
        public static string subscriptionLabel = "Your Subscriptions";
        private static long numMeals;
        private List<string> allSubscriptions = new List<string>();
        private List<long> maxMealsList = new List<long>();
        private string acctUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/";
        public List<string> MealPlanLists = new List<string>();    // List of all Urls for mealplans
        public  List<string> MealPlanNumbers = new List<string>();    // List of all NUMBERS for mealplans
        private static Dictionary<string, Dictionary<string, string>> savedMenu = new Dictionary<string, Dictionary<string, string>>();
        private static Dictionary<string, string> save = new Dictionary<string, string>();
        private static Dictionary<string, string> values = new Dictionary<string, string>();
        private List<string> AllSundays = new List<string>();
        private List<String> AllSaturdays = new List<String>();
        private List<String> AllMondays = new List<String>();
        public static List<MealScheduleSaves.MealScheduleSavedColors> mss = new List<MealScheduleSaves.MealScheduleSavedColors>();
        private static string userID;
        private static string mealPlanNo;
        private static int mealPlanNoTEST;


        public MealSchedule()
        {
            InitializeComponent();
            // Toolbar
            ToolbarItem totalBar = new ToolbarItem
            {
                Text = "Profile",
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            ToolbarItem totalBar2 = new ToolbarItem
            {
                Text = "Log Out",
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            this.ToolbarItems.Add(totalBar);
            this.ToolbarItems.Add(totalBar2);

            userID = App.Database.GetLastItem().UserUid;

            // Function Calls
            getZipcode();
            getDates();
            subscriptionPicker();
            BindingContext = this;
        }

        public MealSchedule(int i)
        {
            InitializeComponent();
            // Toolbar
            ToolbarItem totalBar = new ToolbarItem
            {
                Text = "Profile",
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            ToolbarItem totalBar2 = new ToolbarItem
            {
                Text = "Log Out",
                Order = ToolbarItemOrder.Secondary,
                Priority = 0,
            };
            this.ToolbarItems.Add(totalBar);
            this.ToolbarItems.Add(totalBar2);

            userID = App.Database.GetLastItem().UserUid;

            // Function Calls
            getZipcode();
            getDates();
            subscriptionPicker();
            BindingContext = this;
        }

        private void getZipcode()
        {
            nullPicker.SetValue(IsVisibleProperty, false);
            WebClient client = new WebClient();
            // Get user zipcodes
            var userZipCodes = client.DownloadString(acctUrl + userID);
            var userZipObj = JsonConvert.DeserializeObject<UserInformation>(userZipCodes);

            Boolean zipBool = true;
            for (int i = 0; i < userZipObj.Result.Length; i++)
            {
                zipBool = userZipObj.Result[i].MondayAvailable;
            }

            if (zipBool == true)
            {
                MondayButton.IsVisible = true;
                MondayButton2.IsVisible = true;
                MondayButton3.IsVisible = true;
                MondayButton4.IsVisible = true;
                MondayButton5.IsVisible = true;
                MondayButton6.IsVisible = true;
            }


            for (int numPlans = 0; numPlans < userZipObj.Result.Length; numPlans++)
            {
                string mealPID = userZipObj.Result[numPlans].PurchaseId;
                string mealUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/mealselection/" + mealPID;
                MealPlanLists.Add(mealUrl);
            }

            for (int numPlansNum = 0; numPlansNum < userZipObj.Result.Length; numPlansNum++)
            {
                string mealPID = userZipObj.Result[numPlansNum].PurchaseId;
                MealPlanNumbers.Add(mealPID);
            }

        }

        private void subscriptionPicker()
        {
            WebClient client = new WebClient();
            // Get user zipcodes

            var userPlans = client.DownloadString(acctUrl + userID);
            // Get subscription plans
            var subPlansObj = JsonConvert.DeserializeObject<UserInformation>(userPlans);

            for (int subNum = 0; subNum < subPlansObj.Result.Length; subNum++)
            {
                if (subPlansObj.Result[subNum].BuyerId == userID)
                {
                    allSubscriptions.Add(subPlansObj.Result[subNum].MealPlanDesc);
                    maxMealsList.Add(subPlansObj.Result[subNum].MaximumMeals);
                    SubscriptionPicker.Items.Add(allSubscriptions[subNum]);
                }
            }

            SubscriptionPicker.SelectedIndex = mealPlanNoTEST;
            System.Diagnostics.Debug.WriteLine("MealPlanNo Test Value:" + mealPlanNoTEST);

            if (mealPlanNoTEST <= 0)
            {
                SubscriptionPicker.SelectedIndex = 0;
            }
            else
                SubscriptionPicker.SelectedIndex = mealPlanNoTEST;

            mealPlanNo = MealPlanNumbers[mealPlanNoTEST];
            getPosted(mealPlanNoTEST);
            BindingContext = this;

        }

        private void SubscriptionPicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            Picker p = (Picker)sender;
            nullPicker.SetValue(IsVisibleProperty, false);
            mealPlanNoTEST = SubscriptionPicker.SelectedIndex;

            SubscriptionPicker.Title = subscriptionLabel;
            numMeals = maxMealsList[SubscriptionPicker.SelectedIndex];
            HeaderLabel.Text = allSubscriptions[SubscriptionPicker.SelectedIndex];
            mealPlanNo = MealPlanNumbers[SubscriptionPicker.SelectedIndex];
            System.Diagnostics.Debug.WriteLine("Setting: " + mealPlanNo);

            getPosted(SubscriptionPicker.SelectedIndex);
            System.Diagnostics.Debug.WriteLine("Setting Done " + mealPlanNo);

        }

        private void clickSurprise(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b.ClassId.Equals("SurpriseButton") && SkipButton.BackgroundColor.Equals(Color.FromHex(green)))
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
                else if (b.ClassId.Equals("SurpriseButton2"))
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
                postSurpriseData(sender, e);
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
                            postSkipData(sender, e);
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
                            postSkipData(sender, e);
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
                            postSkipData(sender, e);
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
                            postSkipData(sender, e);
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
                            postSkipData(sender, e);
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
                                saveColors(SubscriptionPicker);

                                break;
                            case "SelectButton2":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton2.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);
                                break;
                            case "SelectButton3":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton3.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);
                                break;
                            case "SelectButton4":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton4.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);
                                break;
                            case "SelectButton5":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton5.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);
                                break;
                            case "SelectButton6":
                                btn.BackgroundColor = Color.FromHex(green);
                                SurpriseButton6.BackgroundColor = Color.FromHex(def);
                                saveColors(SubscriptionPicker);
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
            if (b.ClassId.Equals("AddonButton") && SkipButton.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else if (b.ClassId.Equals("AddonButton2") && SkipButton2.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else if (b.ClassId.Equals("AddonButton3") && SkipButton3.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else if (b.ClassId.Equals("AddonButton4") && SkipButton4.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else if (b.ClassId.Equals("AddonButton5") && SkipButton5.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else if (b.ClassId.Equals("AddonButton6") && SkipButton6.BackgroundColor.Equals(Color.FromHex(green)))
            {
                await Task.FromResult(0);
            }
            else
            {
                setWeekNum(sender, e);
                AddOnChoices ac = new AddOnChoices();
                ac.BindingContext = this;
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
                    setWeekNum(sender, e);
                    System.Diagnostics.Debug.WriteLine("About to move to MC " + getNum());
                    string currentMealPlanId = getPlanNumPicked(); // getPlanNumPicked returns the plan
                    System.Diagnostics.Debug.WriteLine("selected meal plan: " + currentMealPlanId);
                    System.Diagnostics.Debug.WriteLine("week num: " + weekNumber);
                    foreach(var u in weekAffectedList) { // weekAffectedList[weekNumber -1] returns the date
                        System.Diagnostics.Debug.WriteLine("week affected item: " + u);
                    }
                    MealChoices mc = new MealChoices(this);
                    mc.BindingContext = this;
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
                // Done
                case "Sunday":
                    firstSat = dateValue.AddDays(6);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);

                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(dateValue.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(dateValue.AddDays(7 * (i + 1) + 1).ToString("M/dd/yyyy"));
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
                    break;

                case "Monday":
                    firstSat = dateValue.AddDays(5);
                    AllSundays.Add(dateValue.AddDays(6).ToString("M/dd/yyyy"));
                    firstMon = firstSun.AddDays(1);
                    firstSun = dateValue.AddDays(6);

                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));
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

                    break;

                case "Tuesday":
                    // Done
                    firstSat = dateValue.AddDays(4);
                    AllSundays.Add(dateValue.AddDays(5).ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    firstSun = dateValue.AddDays(5);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));
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
                    break;

                case "Wednesday":
                    // Done
                    firstSat = dateValue.AddDays(10);
                    AllSundays.Add(dateValue.AddDays(11).ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    firstSun = dateValue.AddDays(11);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));
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
                    break;

                case "Thursday":
                    // Done
                    firstSat = dateValue.AddDays(9);
                    AllSundays.Add(dateValue.AddDays(10).ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    firstSun = dateValue.AddDays(10);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));
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
                    break;


                // Done
                case "Friday":
                    firstSat = dateValue.AddDays(8);
                    AllSundays.Add(dateValue.AddDays(9).ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    firstSun = dateValue.AddDays(9);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));
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
                    break;

                // Done
                case "Saturday":
                    firstSat = dateValue.AddDays(7);
                    AllSundays.Add(dateValue.AddDays(8).ToString("M/dd/yyyy"));
                    weekAffectedList.Add(firstSat);
                    AllSaturdays.Add(firstSat.ToString("M/dd/yyyy"));

                    firstSun = dateValue.AddDays(8);
                    firstMon = firstSun.AddDays(1);
                    for (int i = 0; i < 6; i++)
                    {
                        AllSundays.Add(firstSun.AddDays(7 * (i + 1)).ToString("M/dd/yyyy"));
                        AllMondays.Add(firstMon.AddDays(7 * i).ToString("M/dd/yyyy"));
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
                    break;
            }
        }

        public List<String> getPurchID()
        {
            WebClient client = new WebClient();

            // Get purchase ID
            var userPurchClient = client.DownloadString(acctUrl + userID);
            var userPurchID = JsonConvert.DeserializeObject<UserInfo>(userPurchClient);
            for (int i = 0; i < userPurchID.Result.Length; i++)
            {
                var purchaseID = userPurchID.Result[i].PaymentId.ToString();
                purchaseIdList.Add(purchaseID);
            }
            return purchaseIdList;
        }

        public void initPaymentID()
        {
            WebClient client = new WebClient();
            // Get purchase ID
            var userPurchClient = client.DownloadString(acctUrl + userID);
            var userPurchID = JsonConvert.DeserializeObject<UserInfo>(userPurchClient);
            for (int i = 0; i < userPurchID.Result.Length; i++)
            {
                var paymentID = userPurchID.Result[i].PurchaseId.ToString();
                purchaseIdList.Add(paymentID);
            }
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
            System.Diagnostics.Debug.WriteLine("Setting Week" + b.Text + " " + weekNumber);

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

            postRemoveAddData(sender, e);
            HttpClient client = new HttpClient();
            List<DateTimeOffset> weekAffectedList = getWeekList();    // Week Affected Dates            
            string deliveryDay = "SKIP";                  // Delivery Days ( 6 of them )
            var dict = new Dictionary<string, int?>();
            dict.Add("", null);

            var mealSelectInfoToSend = new MealSelectInformation
            {
                PurchaseId = purchaseIdList[SubscriptionPicker.SelectedIndex],                  // Constant for now
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
                var response = await client.PostAsync(MealPlanLists[SubscriptionPicker.SelectedIndex], httpContent); // send the json file to database
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
            initPaymentID();
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
            dict.Add("SURPRISE", 0);

            System.Diagnostics.Debug.WriteLine(SubscriptionPicker.SelectedIndex);
            System.Diagnostics.Debug.WriteLine(weekAffectedList[weekNumber - 1]);
            System.Diagnostics.Debug.WriteLine(dict);
            System.Diagnostics.Debug.WriteLine(deliveryDay);




            var mealSelectInfoToSend = new MealSelectInformation
            {
                PurchaseId = purchaseIdList[SubscriptionPicker.SelectedIndex],                  // Constant for now
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
                var response = await client.PostAsync(MealPlanLists[SubscriptionPicker.SelectedIndex], httpContent); // send the json file to database
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

        public async void postRemoveAddData(object sender, EventArgs e)
        {
            initPaymentID();
            int weekNumber;
            Button b = (Button)sender;
            System.Diagnostics.Debug.WriteLine("This is the sender " + b.ClassId + " " + b.Text);
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
            MealSchedule ms = new MealSchedule();
            // Getter Information
            string[] deliveryDayList = ms.getDDArray();                  // Delivery Days ( 6 of them )
            Dictionary<string, int> emptyDict = new Dictionary<string, int>();
            emptyDict.Add("", 0);

            var mealSelectInfoToSend = new AddonInfo
            {
                PurchaseId = purchaseIdList[SubscriptionPicker.SelectedIndex],                  // Constant for now
                WeekAffected = weekAffectedList[weekNumber - 1].ToString("yyyy-MM-dd"),            // Week affected - DONE
                AddonQuantities = emptyDict,               // Dictionary inserted - DONE
                IsAddons = true,                    // Always False - DONE
            };


            string mealSelectInfoJson = JsonConvert.SerializeObject(mealSelectInfoToSend); // convert to json

            try
            {
                var httpContent = new StringContent(mealSelectInfoJson, Encoding.UTF8, "application/json"); // create a http response to send
                var response = await client.PostAsync(MealPlanLists[SubscriptionPicker.SelectedIndex], httpContent); // send the json file to database
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
            if (contains)
            {
                mss.RemoveAll(f => f.planName.Equals(chosenSubscription.SelectedItem.ToString()));
            }
            mss.Add(new MealScheduleSaves.MealScheduleSavedColors
            {
                planName = chosenSubscription.SelectedItem.ToString(),
                controlColor = save,
            });
        }

        public void allDefault()
        {
            foreach (var btn in ButtonStack.Children)
            {
                btn.BackgroundColor = Color.FromHex(def);
            }
        }

        public void getPosted(int selectedIndex)
        {
            allDefault();
            // Web Client Account
            WebClient client = new WebClient();
            //MealChoices mc = new MealChoices();
            var userAccount = client.DownloadString(acctUrl + userID);
            var acctObj = JsonConvert.DeserializeObject<UserInformation>(userAccount);

            // Local Variables (Lists)
            List<string> newWeekAffected = new List<string>();  // WEEK AFFECTED LIST WITHOUT TIME M/DD/YYY
            List<string> JsonWAList = new List<string>();       // WEEK AFFECTED LIST FROM JSON M/DD/YYYY


            // Web Client
            var mealString = client.DownloadString(MealPlanLists[selectedIndex]);
            var mealObj = JsonConvert.DeserializeObject<GetPostedMeals>(mealString);



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
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy");
                        var item = newWeekAffected.IndexOf(hi);
                        if (vare.Text.Equals(mealObj.Result.Meals[i].WeekAffected.AddDays(1).ToString("M/dd/yyyy")))
                        {
                            vare.BackgroundColor = Color.FromHex(green);
                            if (item == 0)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 1)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton2.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton2.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 2)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton3.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton3.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 3)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton4.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton4.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 4)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton5.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton5.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 5)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton6.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton6.BackgroundColor = Color.FromHex(green);
                                }
                            }
                        }
                    }
                }
                else if (mealObj.Result.Meals[i].DeliveryDay.Equals("Monday"))
                {
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy");
                        var item = newWeekAffected.IndexOf(hi);
                        if (vare.Text.Equals(mealObj.Result.Meals[i].WeekAffected.AddDays(2).ToString("M/dd/yyyy")))
                        {
                            vare.BackgroundColor = Color.FromHex(green);
                            if (item == 0)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 1)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton2.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton2.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 2)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton3.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton3.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 3)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton4.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton4.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 4)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton5.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton5.BackgroundColor = Color.FromHex(green);
                                }
                            }
                            else if (item == 5)
                            {
                                if (mealObj.Result.Meals[i].MealSelection.Equals("SURPRISE"))
                                {
                                    SurpriseButton6.BackgroundColor = Color.FromHex(green);
                                }
                                else
                                {
                                    SelectButton6.BackgroundColor = Color.FromHex(green);
                                }
                            }
                        }
                    }
                }
                else if (mealObj.Result.Meals[i].DeliveryDay.Equals("SKIP"))
                {
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Meals[i].WeekAffected.ToString("M/dd/yyyy");
                        var item = newWeekAffected.IndexOf(hi);

                        if (item == 0)
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
            }// Remove possibly

            for (int i = 0; i < mealObj.Result.Addons.Length; i++)
            {
                if (mealObj.Result.Addons[i].WeekAffected != null)
                {
                    foreach (Button vare in ButtonStack.Children)
                    {
                        string hi = mealObj.Result.Addons[i].WeekAffected.ToString("M/dd/yyyy");
                        var iterItem = mealObj.Result.Addons[i].MealSelection.ToString();
                        if (newWeekAffected.Contains(hi) && iterItem != "")
                        {
                            var item = newWeekAffected.IndexOf(hi);
                            if (item == 0)
                            {
                                AddonButton.BackgroundColor = Color.FromHex(yellow);
                            }
                            else if (item == 1)
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

        public string getPlanPicked()
        {
            return MealPlanLists[SubscriptionPicker.SelectedIndex];
        }

        public void setPlanNum()
        {
            mealPlanNo = MealPlanNumbers[SubscriptionPicker.SelectedIndex];
        }

        public string getPlanNumPicked()
        {
            setPlanNum();
            System.Diagnostics.Debug.WriteLine("Plan number picked" + MealPlanNumbers[SubscriptionPicker.SelectedIndex]);
            return MealPlanNumbers[SubscriptionPicker.SelectedIndex];
        }
    }
}