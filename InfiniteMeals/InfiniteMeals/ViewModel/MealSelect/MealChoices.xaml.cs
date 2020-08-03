using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Meals.Model;
using System.Net.Http;
using InfiniteMeals.Model.Database;
using InfiniteMeals.Model.Meals;
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using System.Windows.Input;
using Newtonsoft.Json.Linq;
using InfiniteMeals.Meals;
using System.Net;
using System.Runtime.Serialization;
using InfiniteMeals.ViewModel.Login;
using InfiniteMeals.Model.Login;
using System.Text.RegularExpressions;

namespace InfiniteMeals.ViewModel.MealSelect
{

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealChoices : ContentPage
    {


        private static ObservableCollection<MealGroup> grouped { get; set; } // collection to store all meals retrieved from the meals api 


        public Label quantity; // stores the quantity of total meals


        public MealGroup mealGroup = new MealGroup() { LongName = "Meals", ShortName = "m" }; // stores the weekly meals 
        public MealGroup seasonalMealGroup = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" }; // stores the seasonal meals
        public MealGroup smoothieGroup = new MealGroup() { LongName = "Smoothies", ShortName = "s" }; // stores the smoothies 


        public static string infoImg = "info.jpg"; // image to represent the info icon 
        public static string green = "#8FBC8F"; // color for save button when number of meals is valid 
        public static string def = "#F5F5F5"; // default color for buttons
        public Color colorToReturn = Color.FromHex("#F5F5F5"); // default color 
        private static string mealSelectionUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/mealselection/"; // api to get user's meals selected, meal plan id is required at the end
        private static string mealsUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals"; // gets the meals for the next 6 weeks


        public MealSchedule currentMealSchedule; // represents the current meal schedule the user is on
        public Dictionary<string, int?> mealsSelected = new Dictionary<string, int?>(); // dictionary to store the currently selected meals
        public List<WeekMenu> listOfMenus = new List<WeekMenu>(); // stores the menus for the next 6 weeks
        WebClient client = new WebClient(); // client to handle requests






        public MealChoices()
        {
            InitializeComponent();

        }

        public MealChoices(MealSchedule mealSchedule) {
            this.currentMealSchedule = mealSchedule; 
            InitializeComponent();
            retrieveMealPlan();
            fillListView();
            

        }


        /* - fills the list view with the meals the user can select
           - also fills the list with the number of meals the user already has
           - initializes surprise, skip, and save buttons */
        public void fillListView() {

            var saveNav = new Button {
                Text = "Save"
            };

            saveNav.Clicked += (sender, args) => {
                if(saveNav.BackgroundColor == Color.FromHex(def)) { // if the save button isn't green
                    return; // return
                } else {
                    postData(); // posts the selected meals to database
                    ClickedSave();
                }
            };


            // Normal Meals
            List<String> MenuNames = new List<String>();
            List<String> MenuDescriptions = new List<String>();
            List<String> MenuImages = new List<String>();
            List<int> MenuQty = new List<int>();

            //Nutrition Facts Normal Meals
            List<double?> MenuFats = new List<double?>();
            List<double?> MenuSugars = new List<double?>();
            List<double?> MenuProteins = new List<double?>();

            // Seasonal Meals
            List<String> SeasMenuNames = new List<String>();
            List<String> SeasMenuDescriptions = new List<String>();
            List<String> SeasMenuImages = new List<String>();
            List<int> SeasonalQty = new List<int>();

            // Smoothies
            List<String> SmoothiesNames = new List<String>();
            List<String> SmoothiesDescriptions = new List<String>();
            List<String> SmoothiesImage = new List<String>();
            List<int> SmoothieQty = new List<int>();

            grouped = new ObservableCollection<MealGroup>();



            var lstView = new ListView {
                HasUnevenRows = true,
                SelectionMode = ListViewSelectionMode.None,
            };

            var content = client.DownloadString(mealsUrl); // download the meals for the next 6 weeks
            var obj = JsonConvert.DeserializeObject<Data>(content);

            System.Diagnostics.Debug.WriteLine("week number: " + this.currentMealSchedule.weekNumber);
            // store each menu into listOfMenus
            listOfMenus.Add(obj.Result.MenuForWeek1); // week 1 menu
            listOfMenus.Add(obj.Result.MenuForWeek2); // week 2 menu
            listOfMenus.Add(obj.Result.MenuForWeek3); // week 3 menu
            listOfMenus.Add(obj.Result.MenuForWeek4); // week 4 menu
            listOfMenus.Add(obj.Result.MenuForWeek5); // week 5 menu
            listOfMenus.Add(obj.Result.MenuForWeek6); // week 6 menu

            var menuToUse = listOfMenus[this.currentMealSchedule.weekNumber - 1]; // choose the correct week menu to use

            // fill the weekly menu meals
            for (int u = 0; u < menuToUse.Meals.Weekly.Menu.Length; u++) {
                String imageMeal;
                MenuNames.Add(menuToUse.Meals.Weekly.Menu[u].MealName);
                MenuDescriptions.Add(menuToUse.Meals.Weekly.Menu[u].MealDesc);
                MenuProteins.Add(menuToUse.Meals.Weekly.Menu[u].MealProtein);
                MenuSugars.Add(menuToUse.Meals.Weekly.Menu[u].MealSugar);
                MenuFats.Add(menuToUse.Meals.Weekly.Menu[u].MealFat);

                if (menuToUse.Meals.Weekly.Menu[u].MealPhotoUrl == null) { // if meal photo url isn't available
                    imageMeal = "defaultmeal.png"; // use default
                    MenuImages.Add(imageMeal);
                } else {
                    imageMeal = menuToUse.Meals.Weekly.Menu[u].MealPhotoUrl.ToString();
                    MenuImages.Add(imageMeal);
                }
                long mealQuantity = 0;

                if (mealsSelected.ContainsKey(menuToUse.Meals.Weekly.Menu[u].MealId)) { // if the meals selected dictionary 
                    mealQuantity = (int)mealsSelected[menuToUse.Meals.Weekly.Menu[u].MealId]; // make the meal quantity equal to the quantity in mealsSeleted
                    System.Diagnostics.Debug.WriteLine("meal quantity: " + mealQuantity);
                }

                Meal weeklyMeal = new Meal {
                    id = menuToUse.Meals.Weekly.Menu[u].MealId,
                    name = menuToUse.Meals.Weekly.Menu[u].MealName,
                    description = menuToUse.Meals.Weekly.Menu[u].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = (int)mealQuantity,
                    is_addon = "false"
                };

                if (mealGroup.Any(x => x.id == menuToUse.Meals.Weekly.Menu[u].MealId)) {
                    mealGroup.Remove(mealGroup.Where(x => x.id == menuToUse.Meals.Weekly.Menu[u].MealId).Single());
                    mealGroup.Add(weeklyMeal);
                } else {
                    mealGroup.Add(weeklyMeal); // add meal to meal group 
                }
            }

            // fill the seasonal menu meals 
            for (int u = 0; u < menuToUse.Meals.Seasonal.Menu.Length; u++) {
                String imageMeal;
                MenuNames.Add(menuToUse.Meals.Seasonal.Menu[u].MealName);
                MenuDescriptions.Add(menuToUse.Meals.Seasonal.Menu[u].MealDesc);
                MenuProteins.Add(menuToUse.Meals.Seasonal.Menu[u].MealProtein);
                MenuSugars.Add(menuToUse.Meals.Seasonal.Menu[u].MealSugar);
                MenuFats.Add(menuToUse.Meals.Seasonal.Menu[u].MealFat);

                if (menuToUse.Meals.Seasonal.Menu[u].MealPhotoUrl == null) {
                    imageMeal = "defaultmeal.png";
                    MenuImages.Add(imageMeal);
                }
                else {
                    imageMeal = menuToUse.Meals.Seasonal.Menu[u].MealPhotoUrl.ToString();
                    MenuImages.Add(imageMeal);
                }
                int mealQuantity = 0;

                if (mealsSelected.ContainsKey(menuToUse.Meals.Seasonal.Menu[u].MealId)) {
                    mealQuantity = (int)mealsSelected[menuToUse.Meals.Seasonal.Menu[u].MealId];
                    System.Diagnostics.Debug.WriteLine("meal quantity: " + mealQuantity);
                }

                Meal seasonalMeal = new Meal {
                    id = menuToUse.Meals.Seasonal.Menu[u].MealId,
                    name = menuToUse.Meals.Seasonal.Menu[u].MealName,
                    description = menuToUse.Meals.Seasonal.Menu[u].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = (int)mealQuantity,
                    is_addon = "false"
                };

                if (seasonalMealGroup.Any(x => x.id == menuToUse.Meals.Seasonal.Menu[u].MealId)) {
                    seasonalMealGroup.Remove(seasonalMealGroup.Where(x => x.id == menuToUse.Meals.Seasonal.Menu[u].MealId).Single());
                    seasonalMealGroup.Add(seasonalMeal);
                }
                else {
                    seasonalMealGroup.Add(seasonalMeal); // add meal to seasonal meal group 
                }
            }

            // fill the smoothies menu meals
            for (int u = 0; u < menuToUse.Meals.Smoothies.Menu.Length; u++) {
                String imageMeal;
                MenuNames.Add(menuToUse.Meals.Smoothies.Menu[u].MealName);
                MenuDescriptions.Add(menuToUse.Meals.Smoothies.Menu[u].MealDesc);
                MenuProteins.Add(menuToUse.Meals.Smoothies.Menu[u].MealProtein);
                MenuSugars.Add(menuToUse.Meals.Smoothies.Menu[u].MealSugar);
                MenuFats.Add(menuToUse.Meals.Smoothies.Menu[u].MealFat);

                if (menuToUse.Meals.Smoothies.Menu[u].MealPhotoUrl == null) {
                    imageMeal = "defaultmeal.png";
                    MenuImages.Add(imageMeal);
                }
                else {
                    imageMeal = menuToUse.Meals.Smoothies.Menu[u].MealPhotoUrl.ToString();
                    MenuImages.Add(imageMeal);
                }
                int mealQuantity = 0;

                if (mealsSelected.ContainsKey(menuToUse.Meals.Smoothies.Menu[u].MealId)) {
                    mealQuantity = (int)mealsSelected[menuToUse.Meals.Smoothies.Menu[u].MealId];
                    System.Diagnostics.Debug.WriteLine("meal quantity: " + mealQuantity);
                }

                Meal smoothieMeal = new Meal {
                    id = menuToUse.Meals.Smoothies.Menu[u].MealId,
                    name = menuToUse.Meals.Smoothies.Menu[u].MealName,
                    description = menuToUse.Meals.Smoothies.Menu[u].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = (int)mealQuantity,
                    is_addon = "false"
                };

                if (smoothieGroup.Any(x => x.id == menuToUse.Meals.Smoothies.Menu[u].MealId)) {
                    smoothieGroup.Remove(mealGroup.Where(x => x.id == menuToUse.Meals.Smoothies.Menu[u].MealId).Single());
                    smoothieGroup.Add(smoothieMeal);
                }
                else {
                    smoothieGroup.Add(smoothieMeal); // add to smoothies group
                }
            }

            // add all the weekly, seasonal, and smoothie groups to grouped
            grouped.Add(mealGroup);
            grouped.Add(seasonalMealGroup);
            grouped.Add(smoothieGroup);
            



            var totalMeals = new Label();
            totalMeals.Text = string.Format("Please select {0} meals", (this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value)));
            
            if(this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value) == 0) { // if number of meals is equal to max meals
                saveNav.BackgroundColor = Color.FromHex(green); // set background color of save button to green
            }



            var surpriseNav = new Button {
                Text = "Surprise"
            };
            surpriseNav.Clicked += ClickedSurprise; // event handler for clicking surprise
            surpriseNav.BackgroundColor = Color.FromHex(def); // set background color to default

            var skipNav = new Button {
                Text = "Skip",
                ClassId = "MCSkip",

            };
            skipNav.Clicked += ClickedSkip; // event handler for clicking skip 
            skipNav.BackgroundColor = Color.FromHex(def); // set background color to default


            Grid sl = new Grid(); // grid to contain surprise, skip, and save buttons + totalMeals label
            sl.Children.Add(surpriseNav, 0, 0);
            sl.Children.Add(skipNav, 1, 0);
            sl.Children.Add(saveNav, 2, 0);
            sl.Children.Add(totalMeals, 0, 1);
            totalMeals.VerticalOptions = LayoutOptions.Center;
            totalMeals.HorizontalOptions = LayoutOptions.Center;

            totalMeals.FontSize = 16;
            totalMeals.FontAttributes = FontAttributes.Bold;
            totalMeals.SetValue(Grid.ColumnSpanProperty, 3);

            lstView.Header = sl;

            lstView.ItemsSource = grouped;
            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");
            lstView.GroupShortNameBinding = new Binding("ShortName");

            lstView.ItemTemplate = new DataTemplate(() => {
                var grid = new Grid {
                    HeightRequest = 100,
                    VerticalOptions = LayoutOptions.FillAndExpand
                };

                var nameLabel = new Label {
                    FontAttributes = FontAttributes.Bold,
                    HorizontalTextAlignment = TextAlignment.Start
                };

                nameLabel.Margin = new Thickness(10, 0, 0, 0);

                var imgLabel = new Image {
                    WidthRequest = 150,
                    HeightRequest = 75,
                    Aspect = Aspect.AspectFill,
                    HorizontalOptions = LayoutOptions.CenterAndExpand,
                    VerticalOptions = LayoutOptions.CenterAndExpand
                };

                imgLabel.Margin = new Thickness(10, 0, 0, 10);

                var infoButton = new ImageButton {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    Aspect = Aspect.AspectFit,
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center
                };

                infoButton.Clicked += (sender, e) => {
                    ImageButton stepper = sender as ImageButton;
                    var model = stepper.BindingContext as Meal;
                    DisplayAlert("Ingredients", model.description.ToString(), "OK");
                };

                // button to handle decrementing meal quantitites 
                var decrementMealQuantityButton = new Button {
                    Text = "-"
                };

                // event handler when decrement button is clicked
                decrementMealQuantityButton.Clicked += (sender, e) => {
                    Button btn = sender as Button;
                    Meal meal = btn.BindingContext as Meal;
                    if(meal.qty == 0) { // if quantity is 0, do nothing
                        return;
                    }
                    meal.qty -= 1; // decrement meal quantity
                    saveNav.BackgroundColor = Color.FromHex(def); // make background color default
                    if(meal.qty == 0) {
                        
                        if (mealsSelected.ContainsKey(meal.id)) { // if quantity is 0 and mealsSelected contains meal id
                            mealsSelected.Remove(meal.id); // remove the meal id from the dictionary
                            System.Diagnostics.Debug.WriteLine(meal.id + " was removed");
                            totalMeals.Text = string.Format("Please Select {0} Meals", (this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value))); // change total meals label
                        }
                    } else {
                        mealsSelected[meal.id] = meal.qty; // change so dictionary points to new meal quantity  
                        totalMeals.Text = string.Format("Please Select {0} Meals", (this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value))); // change total meals label
                    }
                };

                // button to handle incrementing meal quantitites 
                var incrementMealQuantityButton = new Button {
                    Text = "+"
                };

                // event handler when increment button is clicked 
                incrementMealQuantityButton.Clicked += (sender, e) => {
                    Button btn = sender as Button;
                    Meal meal = btn.BindingContext as Meal;
                    if(this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value) == 0) { // if the number of meals selected is max 
                        System.Diagnostics.Debug.WriteLine("returning");
                        return; // return
                    }

                    meal.qty += 1; // increment meal quantity 

                    if (!mealsSelected.ContainsKey(meal.id)) { // if meal id isn't in the mealsSelected dictionary 
                        mealsSelected.Add(meal.id, meal.qty); // add the meal id and quantity 
                        totalMeals.Text = string.Format("Please Select {0} Meals", (this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value))); // change total meals label
                    } else { // meal id is in mealsSelected
                        mealsSelected[meal.id] = meal.qty; // change so that the quantity reflects the new quantity
                        totalMeals.Text = string.Format("Please Select {0} Meals", (this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value))); // change total meals label
                    }

                    if (this.currentMealSchedule.getMaxMeals() - mealsSelected.Sum(x => x.Value) == 0) { // if the number of meals selected has reached max 
                        saveNav.BackgroundColor = Color.FromHex(green); // make background color of save button green
                    }
                };

                quantity = new Label {
                    FontSize = 15,
                    FontAttributes = FontAttributes.Bold,
                    HorizontalOptions = LayoutOptions.Start,
                    VerticalOptions = LayoutOptions.Center,
                    VerticalTextAlignment = TextAlignment.Center,
                    HorizontalTextAlignment = TextAlignment.Center
                };

                // set bindings for labels
                nameLabel.SetBinding(Label.TextProperty, "name");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                infoButton.SetBinding(Image.SourceProperty, "infoUrl");
                quantity.SetBinding(Label.TextProperty, "qty");


                // add the meal properties to grid
                grid.Children.Add(imgLabel, 0, 0);
                imgLabel.SetValue(Grid.RowSpanProperty, 2);
                imgLabel.SetValue(Grid.ColumnSpanProperty, 2);
                grid.Children.Add(nameLabel, 2, 0);
                nameLabel.SetValue(Grid.RowSpanProperty, 2);
                nameLabel.SetValue(Grid.ColumnSpanProperty, 2);
                grid.Children.Add(infoButton, 4, 0);
                grid.Children.Add(decrementMealQuantityButton, 3, 1);
                grid.Children.Add(incrementMealQuantityButton, 4, 1);
                grid.Children.Add(quantity, 5, 0);

                return new ViewCell { View = grid, Height = 100 };

            

            });

            Content = lstView; // sets the content to all the items in the listview
            BindingContext = this;

        }

        // retrieves the user's current meal plan and fills the mealsSelected with what the user has selected
        // sets the meal id and quantities in mealsSelected
        public void retrieveMealPlan() { 

            var mealPlanId = this.currentMealSchedule.getPlanNumPicked(); // get the current meal plan id
            var userContent = client.DownloadString(mealSelectionUrl + mealPlanId); // download the selected meals


            var weekAffected = this.currentMealSchedule.getWeekList()[this.currentMealSchedule.weekNumber - 1]; // get the week affected from the current meal schedule


            var userObj = JsonConvert.DeserializeObject<GetPostedMeals>(userContent);
            List<PostedMeals> descList = new List<PostedMeals>();

            for (int i = 0; i < userObj.Result.Meals.Length; i++) {
                descList.Add(userObj.Result.Meals[i]); // add all the meal plans the user has 
            }

            descList.Sort((x, y) => DateTimeOffset.Compare(x.WeekAffected, y.WeekAffected)); // sort list based on date

            foreach(var u in descList) {
                if(weekAffected.DayOfYear == u.WeekAffected.DayOfYear) { // if the day of the week affected match
                    foreach(KeyValuePair<string, long> kvp in u.MealsSelected) { // add all the meal id and quantities to mealsSelected 
                        mealsSelected.Add(kvp.Key, (int)kvp.Value); // selected meals are stored in the mealsSelected dictionary
                    }
                  

                }
            }
        }

      

        private void SaveNav_Clicked(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        /*
         * posts meal select information to the database
         * requires a MealSelectionInformation object with PurchaseId, MealQuantitites, WeekAffected, DeliveryDay, DefaultSelected, and IsAddons
         */
        public async void postData() {
            HttpClient client = new HttpClient();
            MealSchedule ms = this.currentMealSchedule;

            int weekNumber = ms.getNum();
            string postUrl = ms.getPlanPicked();
            string pid = ms.getPlanNumPicked();

            string[] deliveryDayList = ms.getDDArray();

            var mealSelectInfoTosend = new MealSelectInformation {
                PurchaseId = pid,
                MealQuantities = mealsSelected,
                WeekAffected = ms.getWeekList()[ms.weekNumber - 1],
                DeliveryDay = deliveryDayList[0],
                DefaultSelected = false,
                IsAddons = false
            };

            if(mealsSelected.Count == 0) {
                colorToReturn = Color.FromHex(def);
                ClickedSave();
            } else {
                string mealSelectInfoJson = JsonConvert.SerializeObject(mealSelectInfoTosend);

                try {
                    var httpContent = new StringContent(mealSelectInfoJson, Encoding.UTF8, "application/json");
                    var response = await client.PostAsync(postUrl, httpContent);
                    if(response.Content != null) {
                        var responseContent = await response.Content.ReadAsStringAsync();
                        System.Diagnostics.Debug.WriteLine(responseContent);
                    }
                } catch(Exception ex) {
                    System.Diagnostics.Debug.WriteLine(ex.Message);
                }
                colorToReturn = Color.FromHex(green);

                ClickedSave();
            }
        }


        void OnValueChanged(object sender, ValueChangedEventArgs e)
        {
            quantity.Text = String.Format("Stepper value is {0:F1}", e.NewValue);
        }

        private async void ClickedSurprise(object sender, EventArgs e)
        {
            MealSchedule ms = this.currentMealSchedule;
            int weekNumber = this.currentMealSchedule.weekNumber;
            if (weekNumber == 1)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton");
                    Button a = (Button)mealSchedulePage.FindByName("SelectButton");
                    Button d = (Button)mealSchedulePage.FindByName("SurpriseButton");

                    skip1.BackgroundColor = Color.FromHex(def);
                    a.BackgroundColor = Color.FromHex(def);
                    d.BackgroundColor = Color.FromHex(green);
                    ms.postSurpriseData((Button)mealSchedulePage.FindByName("SurpriseButton"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 2)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton2");
                    Button a = (Button)mealSchedulePage.FindByName("SelectButton2");
                    Button d = (Button)mealSchedulePage.FindByName("SurpriseButton2");

                    skip1.BackgroundColor = Color.FromHex(def);
                    a.BackgroundColor = Color.FromHex(def);
                    d.BackgroundColor = Color.FromHex(green);
                    ms.postSurpriseData((Button)mealSchedulePage.FindByName("SurpriseButton2"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 3)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton3");
                    Button a = (Button)mealSchedulePage.FindByName("SelectButton3");
                    Button d = (Button)mealSchedulePage.FindByName("SurpriseButton3");

                    skip1.BackgroundColor = Color.FromHex(def);
                    a.BackgroundColor = Color.FromHex(def);
                    d.BackgroundColor = Color.FromHex(green);
                    ms.postSurpriseData((Button)mealSchedulePage.FindByName("SurpriseButton3"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 4)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton4");
                    Button a = (Button)mealSchedulePage.FindByName("SelectButton4");
                    Button d = (Button)mealSchedulePage.FindByName("SurpriseButton4");

                    skip1.BackgroundColor = Color.FromHex(def);
                    a.BackgroundColor = Color.FromHex(def);
                    d.BackgroundColor = Color.FromHex(green);
                    ms.postSurpriseData((Button)mealSchedulePage.FindByName("SurpriseButton4"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 5)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton5");
                    Button a = (Button)mealSchedulePage.FindByName("SelectButton5");
                    Button d = (Button)mealSchedulePage.FindByName("SurpriseButton5");

                    skip1.BackgroundColor = Color.FromHex(def);
                    a.BackgroundColor = Color.FromHex(def);
                    d.BackgroundColor = Color.FromHex(green);
                    ms.postSurpriseData((Button)mealSchedulePage.FindByName("SurpriseButton5"), e);

                }
                await Navigation.PopAsync();
            }
            else
            {

                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton6");
                    Button a = (Button)mealSchedulePage.FindByName("SelectButton6");
                    Button d = (Button)mealSchedulePage.FindByName("SurpriseButton6");

                    skip1.BackgroundColor = Color.FromHex(def);
                    a.BackgroundColor = Color.FromHex(def);
                    d.BackgroundColor = Color.FromHex(green);
                    ms.postSurpriseData((Button)mealSchedulePage.FindByName("SurpriseButton6"), e);

                }
                await Navigation.PopAsync();
            }
        }

        private async void ClickedSkip(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            //MealSchedule ms = new MealSchedule();
            //int weekNumber = ms.getNum();
            MealSchedule ms = this.currentMealSchedule;
            int weekNumber = this.currentMealSchedule.weekNumber;
            if (weekNumber == 1)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton");
                    Button add1 = (Button)mealSchedulePage.FindByName("AddonButton");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    add1.BackgroundColor = Color.FromHex(def);
                    ms.postRemoveAddData(skip1, e);
                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 2)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton2");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton2");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton2");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton2");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton2");
                    Button add1 = (Button)mealSchedulePage.FindByName("AddonButton2");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    add1.BackgroundColor = Color.FromHex(def);
                    ms.postRemoveAddData(skip1, e);
                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton2"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 3)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton3");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton3");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton3");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton3");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton3");
                    Button add1 = (Button)mealSchedulePage.FindByName("AddonButton3");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    add1.BackgroundColor = Color.FromHex(def);
                    ms.postRemoveAddData(skip1, e);

                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton3"), e);


                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 4)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton4");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton4");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton4");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton4");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton4");
                    Button add1 = (Button)mealSchedulePage.FindByName("AddonButton4");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    add1.BackgroundColor = Color.FromHex(def);
                    ms.postRemoveAddData(skip1, e);

                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton4"), e);

                }
                await Navigation.PopAsync();
            }
            else if (weekNumber == 5)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton5");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton5");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton5");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton5");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton5");
                    Button add1 = (Button)mealSchedulePage.FindByName("AddonButton5");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    add1.BackgroundColor = Color.FromHex(def);
                    ms.postRemoveAddData(skip1, e);

                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton5"), e);

                }
                await Navigation.PopAsync();
            }
            else
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton6");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton6");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton6");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton6");
                    Button add1 = (Button)mealSchedulePage.FindByName("AddonButton6");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    add1.BackgroundColor = Color.FromHex(def);
                    ms.postRemoveAddData(skip1, e);

                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton6"), e);

                }
                await Navigation.PopAsync();
            }
        }

        private async void ClickedSave()
        {
            MealSchedule ms = this.currentMealSchedule;
            int weekNumber = this.currentMealSchedule.weekNumber;
            if (weekNumber == 1)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button selectMealButton = (Button)mealSchedulePage.FindByName("SelectButton");
                    selectMealButton.BackgroundColor = Color.FromHex(green);
                    Button surpriseButton = (Button)mealSchedulePage.FindByName("SurpriseButton");
                    surpriseButton.BackgroundColor = Color.FromHex(def);
                }
            }
            else if (weekNumber == 2)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button selectMealButton = (Button)mealSchedulePage.FindByName("SelectButton2");
                    selectMealButton.BackgroundColor = Color.FromHex(green);
                    Button surpriseButton = (Button)mealSchedulePage.FindByName("SurpriseButton2");
                    surpriseButton.BackgroundColor = Color.FromHex(def);
                }
            }
            else if (weekNumber == 3)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button selectMealButton = (Button)mealSchedulePage.FindByName("SelectButton3");
                    selectMealButton.BackgroundColor = Color.FromHex(green);
                    Button surpriseButton = (Button)mealSchedulePage.FindByName("SurpriseButton3");
                    surpriseButton.BackgroundColor = Color.FromHex(def);
                }
            }
            else if (weekNumber == 4)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button selectMealButton = (Button)mealSchedulePage.FindByName("SelectButton4");
                    selectMealButton.BackgroundColor = Color.FromHex(green);
                    Button surpriseButton = (Button)mealSchedulePage.FindByName("SurpriseButton4");
                    surpriseButton.BackgroundColor = Color.FromHex(def);
                }
            }
            else if (weekNumber == 5)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button selectMealButton = (Button)mealSchedulePage.FindByName("SelectButton5");
                    selectMealButton.BackgroundColor = Color.FromHex(green);
                    Button surpriseButton = (Button)mealSchedulePage.FindByName("SurpriseButton5");
                    surpriseButton.BackgroundColor = Color.FromHex(def);
                }
            }
            else if (weekNumber == 6)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button selectMealButton = (Button)mealSchedulePage.FindByName("SelectButton6");
                    selectMealButton.BackgroundColor = Color.FromHex(green);
                    Button surpriseButton = (Button)mealSchedulePage.FindByName("SurpriseButton6");
                    surpriseButton.BackgroundColor = Color.FromHex(def);
                }
            }
            await Navigation.PopAsync();
        }

        public Color refreshPageSelections()
        {
            return colorToReturn;
        }

        private async void returnBack(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }
    }

}