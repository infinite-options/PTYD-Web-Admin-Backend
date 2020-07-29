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
namespace InfiniteMeals.ViewModel.MealSelect
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MenuView : ContentPage
    {
        private static ObservableCollection<MealGroup> grouped { get; set; }
        private static ObservableCollection<MealGroup> grouped2 { get; set; }
        private static ObservableCollection<MealGroup> grouped3 { get; set; }
        private static ObservableCollection<MealGroup> grouped4 { get; set; }
        private static ObservableCollection<MealGroup> grouped5 { get; set; }
        private static ObservableCollection<MealGroup> grouped6 { get; set; }

        public IList<Meal> Meals { get; private set; }
        public IList<Meal> SeasonalMeals { get; private set; }
        public IList<Meal> Smoothies { get; private set; }

        // Week 1
        public MealGroup mealGroup = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 2
        public MealGroup mealGroup2 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup2 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup2 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 3
        public MealGroup mealGroup3 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup3 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup3 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 4
        public MealGroup mealGroup4 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup4 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup4 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 5
        public MealGroup mealGroup5 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup5 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup5 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 6
        public MealGroup mealGroup6 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public MealGroup seasonalMealGroup6 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public MealGroup smoothieGroup6 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        private static string mealsUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals";
        public static string infoImg = "info.jpg";
        public static int weekNumber = 1;

        public MenuView()
        {
            InitializeComponent();
            getMeals(weekNumber);
        }

        public void getMeals(int weekNumber)
        {
            grouped = new ObservableCollection<MealGroup>();
            grouped2 = new ObservableCollection<MealGroup>();
            grouped3 = new ObservableCollection<MealGroup>();
            grouped4 = new ObservableCollection<MealGroup>();
            grouped5 = new ObservableCollection<MealGroup>();
            grouped6 = new ObservableCollection<MealGroup>();

            // Get JSON Object
            WebClient client = new WebClient();
            var content = client.DownloadString(mealsUrl);
            var obj = JsonConvert.DeserializeObject<Data>(content);


            if (weekNumber == 1)
            {
                var jsonObjectLength = obj.Result.MenuForWeek1.Meals.Weekly.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek1.Meals.Weekly;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek1.Meals.Seasonal.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek1.Meals.Seasonal;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek1.Meals.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek1.Meals.Smoothies;


                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                    }

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    };

                    if (mealGroup.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        mealGroup.Remove(mealGroup.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        mealGroup.Add(holder);

                    }
                    else
                    {
                        mealGroup.Add(holder);
                    }
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                    }

                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    };
                    seasonalMealGroup.Add(holder);
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                    }

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    };
                    smoothieGroup.Add(holder);
                }
                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);
            }
            else if (weekNumber == 2)
            {
                var jsonObjectLength = obj.Result.MenuForWeek2.Meals.Weekly.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek2.Meals.Weekly;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek2.Meals.Seasonal.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek2.Meals.Seasonal;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek2.Meals.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek2.Meals.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                    }


                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    };
                    mealGroup2.Add(holder);
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;

                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                    }


                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    };
                    seasonalMealGroup2.Add(holder);
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;

                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                    }


                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    };
                    smoothieGroup2.Add(holder);
                }

                grouped2.Add(mealGroup2);
                grouped2.Add(seasonalMealGroup2);
                grouped2.Add(smoothieGroup2);

            }

            if(weekNumber == 1)
            {
                lstView.ItemsSource = grouped;
            }
            else if(weekNumber == 2)
            {
                lstView.ItemsSource = grouped2;
            }

            Button switchWeek = new Button
            {
                FontFamily = "CapsRegular",
                FontSize = 20,
                BackgroundColor = Color.Transparent,
            };
            if(weekNumber == 1)
            {
                switchWeek.Clicked += NextWeekMenu;
                switchWeek.Text = "Next Week";
            }
            else
            {
                switchWeek.Clicked += ThisWeekMenu;
                switchWeek.Text = "This Week";
            }

            Grid headingGrid = new Grid();
            headingGrid.Children.Add(switchWeek, 0, 0);

            lstView.Header = headingGrid;
            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");
            lstView.GroupShortNameBinding = new Binding("ShortName");
            lstView.ItemTemplate = new DataTemplate(() =>
            {
                var grid = new Grid
                {
                    VerticalOptions = LayoutOptions.FillAndExpand,
                    HeightRequest = 150,
                };
                var nameLabel = new Label
                {
                    FontAttributes = FontAttributes.Bold,
                    HorizontalTextAlignment = TextAlignment.Center,
                    VerticalOptions = LayoutOptions.Center,
                    FontSize = 16,
                };
                var imgLabel = new Image
                {
                    WidthRequest = 150,
                    HeightRequest = 150,
                    Aspect = Aspect.AspectFill,
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center
                };

                nameLabel.SetBinding(Label.TextProperty, "name");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                nameLabel.FontFamily = "CapsRegular";

                grid.Children.Add(imgLabel, 0, 0);
                imgLabel.SetValue(Grid.RowSpanProperty, 2);
                grid.Children.Add(nameLabel, 1, 0 );
                nameLabel.SetValue(Grid.RowSpanProperty, 2);


                return new ViewCell { View = grid };
            });

            Content = lstView;
            BindingContext = this;
        }

       public void NextWeekMenu (object sender, EventArgs e)
        {
            weekNumber = 2;
            getMeals(weekNumber);

        }
        public void ThisWeekMenu(object sender, EventArgs e)
        {
            weekNumber = 1;
            getMeals(weekNumber);

        }
    }
}
