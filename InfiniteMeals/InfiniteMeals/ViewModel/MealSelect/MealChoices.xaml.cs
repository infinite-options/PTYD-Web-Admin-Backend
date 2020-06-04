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
using Newtonsoft.Json;
using System.Collections.ObjectModel;

namespace InfiniteMeals.MealSelect
{

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealChoices : ContentPage
    {
        private ObservableCollection<MealGroup> grouped { get; set; }

        public IList<Meal> Meals { get; private set; }
        public IList<Meal> SeasonalMeals { get; private set; }
        public IList<Meal> Smoothies { get; private set; }
        public IList<Meal> AllMeals { get; private set; }
        public Label quantity;
        String infoImg = "info.jpg";
        public MealChoices()
        {
            InitializeComponent();
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

            //Nutrition Facts Normal Meals
            List<double?> MenuForWeek1Fat = new List<double?>();
            List<double?> MenuForWeek1Sugar = new List<double?>();
            List<double?> MenuForWeek1Prot = new List<double?>();

            // Seasonal Meals
            List<String> SeasMenuForWeek1Names = new List<String>();
            List<String> SeasMenuForWeek1Desc = new List<String>();
            List<String> SeasMenuForWeek1Image = new List<String>();

            // Smoothies
            List<String> SmoothiesNames = new List<String>();
            List<String> SmoothiesDesc = new List<String>();
            List<String> SmoothiesImage = new List<String>();
            var lstView = new ListView { HasUnevenRows = true};

            // Grouping
            grouped = new ObservableCollection<MealGroup>();
            var mealGroup = new MealGroup() { LongName = "Meals", ShortName= "m"};
            var seasonalMealGroup = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
            var smoothieGroup = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

            // Data
            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);


            for(int placeHolder = 0; placeHolder < obj.Result.MenuForWeek1.Meals.Weekly.Menu.Length; placeHolder++)
            {
                String imageMeal;
                /*MenuForWeek1Names.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealName);
                MenuForWeek1Desc.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealDesc);
                MenuForWeek1Prot.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealFat);
                MenuForWeek1Sugar.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealSugar);
                MenuForWeek1Fat.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealFat);
                MenuForWeek1Image.Add(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealPhotoUrl.ToString());*/
                if(obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealPhotoUrl== null)
                {
                    imageMeal = "defaultmeal.png";
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealPhotoUrl.ToString();
                }

                mealGroup.Add(new Meal
                {
                    name = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealName,
                    description = obj.Result.MenuForWeek1.Meals.Weekly.Menu[placeHolder].MealDesc,
                    imageUrl= imageMeal,
                    infoUrl = infoImg,
                }) ;

            }

            for (int placeHolderSeas = 0; placeHolderSeas < obj.Result.MenuForWeek1.Meals.Seasonal.Menu.Length; placeHolderSeas++)
            {
                String imageMeal;
                /* SeasMenuForWeek1Names.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealName);
                 SeasMenuForWeek1Desc.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealDesc);
                 //SeasMenuForWeek1Image.Add(obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString());*/
                if (obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                }
                seasonalMealGroup.Add(new Meal
                {
                    name = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealName,
                    description = obj.Result.MenuForWeek1.Meals.Seasonal.Menu[placeHolderSeas].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                });

            }

            for (int smooth = 0; smooth < obj.Result.MenuForWeek1.Meals.Smoothies.Menu.Length; smooth++)
            {
                String imageMeal;
                /*SmoothiesNames.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealName);
                SmoothiesDesc.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealDesc);
                //SmoothiesImage.Add(obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealPhotoUrl.ToString());*/

                if (obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealPhotoUrl.ToString();
                }
                smoothieGroup.Add(new Meal
                {
                    name = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealName,
                    description = obj.Result.MenuForWeek1.Meals.Smoothies.Menu[smooth].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,

                });
            }

            grouped.Add(mealGroup);
            grouped.Add(seasonalMealGroup);
            grouped.Add(smoothieGroup);
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
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center };
                var imgLabel = new Image
                {
                    WidthRequest = 200,
                    HeightRequest = 100,
                    Aspect = Aspect.AspectFill,
                    HorizontalOptions = LayoutOptions.CenterAndExpand,
                    VerticalOptions = LayoutOptions.CenterAndExpand
                };
                var infoButton = new ImageButton {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    Aspect = Aspect.AspectFit,
                    HorizontalOptions = LayoutOptions.Start,
                    VerticalOptions= LayoutOptions.Center,
            };
                infoButton.Margin = new Thickness(50,0,0,0);
                var steppers = new Stepper {
                    Value = 0,
                    Maximum = 10,
                    Increment = 1,
                    HeightRequest = 50
                };

                Label displayLabel = new Label
                {
                    Text = "0",
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.CenterAndExpand
                };

                steppers.ValueChanged += (sender, e) =>
                {
                    displayLabel.Text = string.Format("{0}", steppers.Value);
                };

                quantity = new Label {
                    FontAttributes = FontAttributes.Bold,
                    HorizontalTextAlignment = TextAlignment.Start,
                    VerticalTextAlignment=  TextAlignment.Center,
                };
                quantity.Margin = new Thickness(0, 0, 100, 0);

                nameLabel.SetBinding(Label.TextProperty, "name");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                infoButton.SetBinding(Image.SourceProperty, "infoUrl");
                
                grid.Children.Add(imgLabel, 0, 0);
                imgLabel.SetValue(Grid.RowSpanProperty, 2);
                grid.Children.Add(nameLabel, 1, 0);
                grid.Children.Add(infoButton, 2, 0);
                grid.Children.Add(steppers, 2, 1);
                steppers.SetValue(Grid.ColumnSpanProperty, 2);
                grid.Children.Add(displayLabel, 3, 0);

                return new ViewCell { View = grid, Height = 100};
            });

            Content = lstView;
            BindingContext = this;
        }

        void OnValueChanged(object sender, ValueChangedEventArgs e)
        {
            quantity.Text = String.Format("Stepper value is {0:F1}", e.NewValue);
        }
        private async void ClickedSelectMeal(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSelect.MealChoices());
        }

        private async void ClickedSelect(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MealSelect.MealChoices());
        }


        private void ClickedInfo(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("here " + sender);
            //DisplayAlert("Nutrition Facts", item.Description.ToString() , "OK");
        }

       void OnListViewItemSelected(object sender, SelectedItemChangedEventArgs e)
       {
           Meal selectedItem = e.SelectedItem as Meal;
           DisplayAlert("Ingredients", selectedItem.description.ToString(), "OK");
        }

         void OnListViewItemTapped(object sender, ItemTappedEventArgs e)
       {
           Meal tappedItem = e.Item as Meal;
       }

    }

}
 