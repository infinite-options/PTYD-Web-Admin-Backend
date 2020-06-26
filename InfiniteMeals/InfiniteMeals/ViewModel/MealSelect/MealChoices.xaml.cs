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

namespace InfiniteMeals.MealSelect
{

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealChoices : ContentPage
    {
        public List<String> purchaseIdList = new List<String>();

        int totalMealsSelected;
        private ObservableCollection<MealGroup> grouped { get; set; }
        public IList<Meal> Meals { get; private set; }
        public IList<Meal> SeasonalMeals { get; private set; }
        public IList<Meal> Smoothies { get; private set; }
        public IList<Meal> AllMeals { get; private set; }
        public IList<Meal> MealSelectionList { get; private set; }
        public Dictionary<string, int> mealQtyDict = new Dictionary<string, int>();
        public Label quantity;
        public MealGroup mealGroup = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup = new MealGroup() { LongName = "Smoothies", ShortName = "s" };
        String infoImg = "info.jpg";

        public MealChoices()
        {
            InitializeComponent();
            getPurchID();
            getData();
        }

        public async void getData()
        { 
            Meals = new List<Meal>();
            SeasonalMeals = new List<Meal>();
            Smoothies = new List<Meal>();

            // Normal Meals
            List<String> MenuForWeek1Names = new List<String>();
            List<String> MenuForWeek1Desc = new List<String>();
            List<String> MenuForWeek1Image = new List<String>();
            List<int> MenuQty = new List<int>();

            //Nutrition Facts Normal Meals
            List<double?> MenuForWeek1Fat = new List<double?>();
            List<double?> MenuForWeek1Sugar = new List<double?>();
            List<double?> MenuForWeek1Prot = new List<double?>();

            // Seasonal Meals
            List<String> SeasMenuForWeek1Names = new List<String>();
            List<String> SeasMenuForWeek1Desc = new List<String>();
            List<String> SeasMenuForWeek1Image = new List<String>();
            List<int> SeasonalQty = new List<int>();

            // Smoothies
            List<String> SmoothiesNames = new List<String>();
            List<String> SmoothiesDesc = new List<String>();
            List<String> SmoothiesImage = new List<String>();
            List<int> SmoothieQty = new List<int>();

            var lstView = new ListView {
                HasUnevenRows = true,
                SelectionMode = ListViewSelectionMode.None,
            };

            // Grouping
            grouped = new ObservableCollection<MealGroup>();

            // Data
            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);


            for (int placeHolder = 0; placeHolder < obj.Result.MenuForWeek1.Meals.Weekly.Menu.Length; placeHolder++)
            {
                String imageMeal;
                MenuForWeek1Names.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealName);
                MenuForWeek1Desc.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealDesc);
                MenuForWeek1Prot.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealFat);
                MenuForWeek1Sugar.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealSugar);
                MenuForWeek1Fat.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealFat);

                if (obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                    MenuForWeek1Image.Add(imageMeal);
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealPhotoUrl.ToString();
                    MenuForWeek1Image.Add(imageMeal);
                }

                mealGroup.Add(new Meal
                {
                    id = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealId,
                    name = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealName,
                    description = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = 0,
                    is_addon = "false",
                });
            }

            for (int placeHolderSeas = 0; placeHolderSeas < obj.Result.MenuForWeek1.Meals.Seasonal.Menu.Length; placeHolderSeas++)
            {
                String imageMeal;
                SeasMenuForWeek1Names.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealName);
                SeasMenuForWeek1Desc.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealDesc);
                if (obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                    SeasMenuForWeek1Image.Add(imageMeal);
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                    SeasMenuForWeek1Image.Add(imageMeal);
                }
                seasonalMealGroup.Add(new Meal
                {
                    id = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealId,
                    name = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealName,
                    description = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = 0,
                    is_addon = "false",
                });

            }

            for (int smooth = 0; smooth < obj.Result.MenuForWeek1.Meals.Smoothies.Menu.Length; smooth++)
            {
                String imageMeal;
                SmoothiesNames.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealName);
                SmoothiesDesc.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealDesc);
                if (obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                    SmoothiesImage.Add(imageMeal);
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealPhotoUrl.ToString();
                    SmoothiesImage.Add(imageMeal);
                }
                smoothieGroup.Add(new Meal
                {
                    id = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealId,
                    name = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealName,
                    description = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = 0,
                    is_addon = "false",
                });
            }

            grouped.Add(mealGroup);
            grouped.Add(seasonalMealGroup);
            grouped.Add(smoothieGroup);

            var surpriseNav = new Button
            {
                Text = "Surprise"
            };
            surpriseNav.Clicked += ClickedSurprise;

            var skipNav = new Button
            {
                Text = "Skip"
            };
            skipNav.Clicked += ClickedSkip;

            var saveNav = new Button
            {
                Text = "Save"
            };
            saveNav.Clicked += postData;

            Grid sl = new Grid();
            sl.Children.Add(surpriseNav, 0, 0);
            sl.Children.Add(skipNav, 1, 0);
            sl.Children.Add(saveNav, 2, 0);
            lstView.Header = sl;


            lstView.ItemsSource = grouped;
            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");
            lstView.GroupShortNameBinding = new Binding("ShortName");

            lstView.ItemTemplate = new DataTemplate(() =>
            {
                var grid = new Grid { HeightRequest = 100,
                    VerticalOptions = LayoutOptions.FillAndExpand
                };
                var nameLabel = new Label {
                    FontAttributes = FontAttributes.Bold,
                    HorizontalTextAlignment = TextAlignment.Start,
                };
                nameLabel.Margin = new Thickness(10, 0, 0, 0);
                var imgLabel = new Image
                {
                    WidthRequest = 150,
                    HeightRequest = 75,
                    Aspect = Aspect.AspectFill,
                    HorizontalOptions = LayoutOptions.CenterAndExpand,
                    VerticalOptions = LayoutOptions.CenterAndExpand
                };
                imgLabel.Margin = new Thickness(10, 0, 0, 10);
                Label quantity = new Label
                {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center
                };
                var infoButton = new ImageButton {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    Aspect = Aspect.AspectFit,
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center,
                };
                infoButton.Clicked += (sender, e) =>
                {
                    ImageButton stepper = sender as ImageButton;
                    var model = stepper.BindingContext as Meal;
                    DisplayAlert("Ingredients", model.description.ToString(), "OK");
                };

                var steppers = new Stepper {
                    Value = 0,
                    Maximum = 10,
                    Increment = 1,
                    HeightRequest = 50,
                    Scale = 0.5,
                    HorizontalOptions = LayoutOptions.End,
                    VerticalOptions = LayoutOptions.Center,

                };
                steppers.Margin = new Thickness(40, 0, 0, 0);

                steppers.ValueChanged += (sender, e) =>
                {
                    Stepper stepper = sender as Stepper;
                    var model = stepper.BindingContext as Meal;
                    int stepperVal = (int)stepper.Value;

                    if (stepperVal > model.qty)
                    {
                        model.qty = (int)steppers.Value;
                        totalMealsSelected += 1;
                        model.order_qty += 1;

                    }
                    else if (stepperVal < model.qty)
                    {

                        model.qty = (int)steppers.Value;
                        totalMealsSelected -= 1;
                        model.order_qty -= 1;
                        if (model.qty < 0)
                        {
                            model.order_qty = 0;
                            totalMealsSelected = 0;
                        }
                    }

                    System.Diagnostics.Debug.WriteLine("Total Selections: " + model.id + " " + model.name + " " + model.order_qty + " " + totalMealsSelected);

                    // Replace value in dictionary if key exists
                    if (mealQtyDict.ContainsKey(model.id))
                    {
                        mealQtyDict.Remove(model.id);
                    }
                    mealQtyDict.Add(model.id, model.order_qty);
                };

                quantity = new Label {
                    FontSize = 15,
                    FontAttributes = FontAttributes.Bold,
                    HorizontalOptions = LayoutOptions.Start,
                    VerticalOptions = LayoutOptions.Center,
                    VerticalTextAlignment = TextAlignment.Center,
                    HorizontalTextAlignment = TextAlignment.Center,

                };

                nameLabel.SetBinding(Label.TextProperty, "name");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                infoButton.SetBinding(Image.SourceProperty, "infoUrl");
                quantity.SetBinding(Label.TextProperty, "qty");

                grid.Children.Add(imgLabel, 0, 0);
                imgLabel.SetValue(Grid.RowSpanProperty, 2);
                imgLabel.SetValue(Grid.ColumnSpanProperty, 2);
                grid.Children.Add(nameLabel, 2, 0);
                nameLabel.SetValue(Grid.RowSpanProperty, 2);
                nameLabel.SetValue(Grid.ColumnSpanProperty, 2);
                grid.Children.Add(infoButton, 4, 0);
                grid.Children.Add(steppers, 3, 1);
                steppers.SetValue(Grid.ColumnSpanProperty, 3);
                grid.Children.Add(quantity, 5, 0);

                return new ViewCell { View = grid, Height = 100 };
            });

            Content = lstView;
            BindingContext = this;
        }

        public async void postData(object sender, EventArgs e)
        {
            HttpClient client = new HttpClient();
            Meals.MealSchedule mealSched = new Meals.MealSchedule();

            // Getter Information 
            List<DateTimeOffset> weekAffectedList = mealSched.getWeekList();    // Week Affected Dates
            for(int i = 0; i < weekAffectedList.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine("WeekAffected: " + weekAffectedList[i]);
            }
            string[] deliveryDayList = mealSched.getDDArray();                  // Delivery Days ( 6 of them )
            for (int i = 0; i < deliveryDayList.Length; i++)
            {
                System.Diagnostics.Debug.WriteLine("DRIGHT HERE: " + deliveryDayList[i]);
            }

            var mealSelectInfoToSend = new MealSelectInformation
            {
                PurchaseId = "300-000001",                  // Constant for now
                WeekAffected = weekAffectedList[0],            // Week affected - DONE
                MealQuantities = mealQtyDict,               // Dictionary inserted - DONE
                DeliveryDay = deliveryDayList[0],               // Day selected - DONE
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

        public async void getPurchID()
        {
            HttpClient client = new HttpClient();

            // Get user zipcodes
            var userPurchClient = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000006");
            var userPurchID = JsonConvert.DeserializeObject<UserInfo>(userPurchClient);
            for (int i = 0; i < userPurchID.Result.Length; i++)
            {
                var purchaseID = userPurchID.Result[i].PaymentId.ToString();
                purchaseIdList.Add(purchaseID);
            }

        }

        public List<String> getPurchaseIdList()
        {
            getPurchID();
            return purchaseIdList;
        }

        void OnValueChanged(object sender, ValueChangedEventArgs e)
        {
            quantity.Text = String.Format("Stepper value is {0:F1}", e.NewValue);
        }

        private async void ClickedSurprise(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Meals.MealSchedule());
        }

        private async void ClickedSkip(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Meals.MealSchedule());
        }

        private async void ClickedSave(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }

    }

}
 