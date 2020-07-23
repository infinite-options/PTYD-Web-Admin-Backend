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
    public partial class MealChoices : ContentPage
    {
        public List<String> purchaseIdList = new List<String>();
        public static int totalMealsSelected;
        public static int totalMealsSelected2;
        public static int totalMealsSelected3;
        public static int totalMealsSelected4;
        public static int totalMealsSelected5;
        public static int totalMealsSelected6;

        private static ObservableCollection<MealGroup> grouped { get; set; }
        private static ObservableCollection<MealGroup> grouped2 { get; set; }
        private static ObservableCollection<MealGroup> grouped3 { get; set; }
        private static ObservableCollection<MealGroup> grouped4 { get; set; }
        private static ObservableCollection<MealGroup> grouped5 { get; set; }
        private static ObservableCollection<MealGroup> grouped6 { get; set; }

        public IList<Meal> Meals { get; private set; }
        public IList<Meal> SeasonalMeals { get; private set; }
        public IList<Meal> Smoothies { get; private set; }
        public IList<Meal> AllMeals { get; private set; }
        public IList<Meal> MealSelectionList { get; private set; }
        public Dictionary<string, int?> mealQtyDict = new Dictionary<string, int?>();
<<<<<<< HEAD
        public Label quantity;
        public static List<DateTimeOffset> weekAffectedDates = new List<DateTimeOffset>();

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
=======
        public static Label quantity;

        // Week 1
        public static MealGroup mealGroup = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public static MealGroup seasonalMealGroup = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public static MealGroup smoothieGroup = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 2
        public static MealGroup mealGroup2 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public static MealGroup seasonalMealGroup2 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public static MealGroup smoothieGroup2 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 3
        public static MealGroup mealGroup3 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public static MealGroup seasonalMealGroup3 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public static MealGroup smoothieGroup3 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 4
        public static MealGroup mealGroup4 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public static MealGroup seasonalMealGroup4 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public static MealGroup smoothieGroup4 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 5
        public static MealGroup mealGroup5 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public static MealGroup seasonalMealGroup5 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public static MealGroup smoothieGroup5 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };

        // Week 6
        public static MealGroup mealGroup6 = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public static MealGroup seasonalMealGroup6 = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public static MealGroup smoothieGroup6 = new MealGroup() { LongName = "Smoothies", ShortName = "s" };
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

        private string userID;
        public static string infoImg = "info.jpg";
        public static string green = "#8FBC8F";
        public static string def = "#F5F5F5";
        public Color colorToReturn = Color.FromHex("#F5F5F5");
        private static string mealSelectionUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/mealselection/";
        private static string mealsUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals";
        private static string acctUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/";
<<<<<<< HEAD
        private long mealsSelectedHere;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

        public MealChoices()
        {
            InitializeComponent();
            getUserAcct();
            getPurchID();
            getData();
        }

        public string getUserAcct()
        {
            var table = App.Database.GetLastItem();
<<<<<<< HEAD
=======
            System.Diagnostics.Debug.WriteLine("user id here " + table.UserUid);
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
            userID = table.UserUid;
            return table.UserUid;
        }

        public void getData()
        {
            Dictionary<string, long> quantityDictionary = new Dictionary<string, long>();

            int testHolder = 0;
            MealSchedule ms = new MealSchedule(testHolder);
            long mealsAllowed = ms.getMaxMeals();
<<<<<<< HEAD
            int weekNumber = ms.getNum();
            var saveNav = new Button
            {
                Text = "Save"
            };

=======

            int weekNumber = ms.getNum();
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

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

            var lstView = new ListView
            {
                HasUnevenRows = true,
                SelectionMode = ListViewSelectionMode.None,
            };

            // Grouping
            grouped = new ObservableCollection<MealGroup>();
            grouped2 = new ObservableCollection<MealGroup>();
            grouped3 = new ObservableCollection<MealGroup>();
            grouped4 = new ObservableCollection<MealGroup>();
            grouped5 = new ObservableCollection<MealGroup>();
            grouped6 = new ObservableCollection<MealGroup>();

            // Data

            WebClient client = new WebClient();
            var content = client.DownloadString(mealsUrl);
            var obj = JsonConvert.DeserializeObject<Data>(content);

<<<<<<< HEAD
            // User PID
            string planNum = ms.getPlanNumPicked();
            var userContent = client.DownloadString(mealSelectionUrl + planNum);
            System.Diagnostics.Debug.WriteLine("right here" + mealSelectionUrl + planNum);

            var userObj = JsonConvert.DeserializeObject<GetPostedMeals>(userContent);
            List<PostedMeals> descList = new List<PostedMeals>();

            for(int i = 0; i < userObj.Result.Meals.Length; i++)
            {
                descList.Add(userObj.Result.Meals[i]);
            }

            descList.Sort((x, y) => DateTimeOffset.Compare(x.WeekAffected, y.WeekAffected));


            for(int i = 0; i < userObj.Result.Meals.Length; i++)
            {
                foreach (var item in userObj.Result.Meals[i].MealsSelected)
                {
                    if (quantityDictionary.ContainsKey(item.Key))
                    {
                        quantityDictionary.Remove(item.Key);
                        quantityDictionary.Add(item.Key, item.Value);
                        mealsSelectedHere -= item.Value;
                        mealsSelectedHere += item.Value;
                    }
                    else
                        quantityDictionary.Add(item.Key, item.Value);
                }
            }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
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
                    MenuForWeek1Names.Add(jsonObject.Menu[placeHolder].MealName);
                    MenuForWeek1Desc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    MenuForWeek1Prot.Add(jsonObject.Menu[placeHolder].MealProtein);
                    MenuForWeek1Sugar.Add(jsonObject.Menu[placeHolder].MealSugar);
                    MenuForWeek1Fat.Add(jsonObject.Menu[placeHolder].MealFat);

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        MenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if(quantityDictionary.ContainsKey(jsonObject.Menu[placeHolder].MealId))
                    {
                        quantityHolder = (int) quantityDictionary[jsonObject.Menu[placeHolder].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };

<<<<<<< HEAD
                    System.Diagnostics.Debug.WriteLine("Holder: " + holder.id + " " +holder.name + " " + holder.qty);
                    mealsSelectedHere += holder.qty;

                    if (mealGroup.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
=======
                    if(mealGroup.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
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
                    SeasMenuForWeek1Names.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealName);
                    SeasMenuForWeek1Desc.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc);
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSeasonal.Menu[placeHolderSeas].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };

<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;


=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    if (seasonalMealGroup.Any(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        seasonalMealGroup.Remove(seasonalMealGroup.Where(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId).Single());
                        seasonalMealGroup.Add(holder);

                    }
                    else
                    {
                        seasonalMealGroup.Add(holder);
                    }
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    SmoothiesNames.Add(jsonObjectSmoothie.Menu[smooth].MealName);
                    SmoothiesDesc.Add(jsonObjectSmoothie.Menu[smooth].MealDesc);
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SmoothiesImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                        SmoothiesImage.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSmoothie.Menu[smooth].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };

<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
                    if (smoothieGroup.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup.Remove(smoothieGroup.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup.Add(holder);

                    }
                    else
                    {
                        smoothieGroup.Add(holder);
                    }
                }
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (smoothieGroup.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup.Remove(smoothieGroup.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup.Add(holder);

                    }
                    else
                    {
                        smoothieGroup.Add(holder);
                    }
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
                    MenuForWeek1Names.Add(jsonObject.Menu[placeHolder].MealName);
                    MenuForWeek1Desc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    MenuForWeek1Prot.Add(jsonObject.Menu[placeHolder].MealProtein);
                    MenuForWeek1Sugar.Add(jsonObject.Menu[placeHolder].MealSugar);
                    MenuForWeek1Fat.Add(jsonObject.Menu[placeHolder].MealFat);

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        MenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    // Testing here! 
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObject.Menu[placeHolder].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObject.Menu[placeHolder].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (mealGroup2.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        mealGroup2.Remove(mealGroup2.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        mealGroup2.Add(holder);

                    }
                    else
                    {
                        mealGroup2.Add(holder);
                    }
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;
                    SeasMenuForWeek1Names.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealName);
                    SeasMenuForWeek1Desc.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc);
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSeasonal.Menu[placeHolderSeas].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (seasonalMealGroup.Any(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        seasonalMealGroup2.Remove(seasonalMealGroup2.Where(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId).Single());
                        seasonalMealGroup2.Add(holder);

                    }
                    else
                    {
                        seasonalMealGroup2.Add(holder);
                    }
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    SmoothiesNames.Add(jsonObjectSmoothie.Menu[smooth].MealName);
                    SmoothiesDesc.Add(jsonObjectSmoothie.Menu[smooth].MealDesc);
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SmoothiesImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                        SmoothiesImage.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSmoothie.Menu[smooth].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (smoothieGroup2.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup2.Remove(smoothieGroup2.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup2.Add(holder);

                    }
                    else
                    {
                        smoothieGroup2.Add(holder);
                    }
                }

                grouped2.Add(mealGroup2);
                grouped2.Add(seasonalMealGroup2);
                grouped2.Add(smoothieGroup2);

            }
            else if (weekNumber == 3)
            {
                var jsonObjectLength = obj.Result.MenuForWeek3.Meals.Weekly.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek3.Meals.Weekly;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek3.Meals.Seasonal.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek3.Meals.Seasonal;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek3.Meals.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek3.Meals.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    MenuForWeek1Names.Add(jsonObject.Menu[placeHolder].MealName);
                    MenuForWeek1Desc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    MenuForWeek1Prot.Add(jsonObject.Menu[placeHolder].MealProtein);
                    MenuForWeek1Sugar.Add(jsonObject.Menu[placeHolder].MealSugar);
                    MenuForWeek1Fat.Add(jsonObject.Menu[placeHolder].MealFat);

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        MenuForWeek1Image.Add(imageMeal);
                    }
<<<<<<< HEAD

                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObject.Menu[placeHolder].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObject.Menu[placeHolder].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }


=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (mealGroup3.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        mealGroup3.Remove(mealGroup3.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        mealGroup3.Add(holder);

                    }
                    else
                    {
                        mealGroup3.Add(holder);
                    }
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;
                    SeasMenuForWeek1Names.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealName);
                    SeasMenuForWeek1Desc.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc);
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSeasonal.Menu[placeHolderSeas].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (seasonalMealGroup3.Any(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        seasonalMealGroup3.Remove(seasonalMealGroup3.Where(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId).Single());
                        seasonalMealGroup3.Add(holder);

                    }
                    else
                    {
                        seasonalMealGroup3.Add(holder);
                    }
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    SmoothiesNames.Add(jsonObjectSmoothie.Menu[smooth].MealName);
                    SmoothiesDesc.Add(jsonObjectSmoothie.Menu[smooth].MealDesc);
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SmoothiesImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                        SmoothiesImage.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSmoothie.Menu[smooth].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }


=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (smoothieGroup3.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup3.Remove(smoothieGroup3.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup3.Add(holder);

                    }
                    else
                    {
                        smoothieGroup3.Add(holder);
                    }
                }

                grouped3.Add(mealGroup3);
                grouped3.Add(seasonalMealGroup3);
                grouped3.Add(smoothieGroup3);
            }
            else if (weekNumber == 4)
            {
                var jsonObjectLength = obj.Result.MenuForWeek4.Meals.Weekly.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek4.Meals.Weekly;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek4.Meals.Seasonal.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek4.Meals.Seasonal;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek4.Meals.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek4.Meals.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    MenuForWeek1Names.Add(jsonObject.Menu[placeHolder].MealName);
                    MenuForWeek1Desc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    MenuForWeek1Prot.Add(jsonObject.Menu[placeHolder].MealProtein);
                    MenuForWeek1Sugar.Add(jsonObject.Menu[placeHolder].MealSugar);
                    MenuForWeek1Fat.Add(jsonObject.Menu[placeHolder].MealFat);

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObject.Menu[placeHolder].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObject.Menu[placeHolder].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

<<<<<<< HEAD

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (mealGroup4.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        mealGroup4.Remove(mealGroup4.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        mealGroup4.Add(holder);

                    }
                    else
                    {
                        mealGroup4.Add(holder);
                    }
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;
                    SeasMenuForWeek1Names.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealName);
                    SeasMenuForWeek1Desc.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc);
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSeasonal.Menu[placeHolderSeas].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (seasonalMealGroup4.Any(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        seasonalMealGroup4.Remove(seasonalMealGroup4.Where(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId).Single());
                        seasonalMealGroup4.Add(holder);

                    }
                    else
                    {
                        seasonalMealGroup4.Add(holder);
                    }
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    SmoothiesNames.Add(jsonObjectSmoothie.Menu[smooth].MealName);
                    SmoothiesDesc.Add(jsonObjectSmoothie.Menu[smooth].MealDesc);
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SmoothiesImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                        SmoothiesImage.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSmoothie.Menu[smooth].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (smoothieGroup4.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup4.Remove(smoothieGroup4.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup4.Add(holder);

                    }
                    else
                    {
                        smoothieGroup4.Add(holder);
                    }
                }

                grouped4.Add(mealGroup4);
                grouped4.Add(seasonalMealGroup4);
                grouped4.Add(smoothieGroup4);
            }
            else if (weekNumber == 5)
            {
                var jsonObjectLength = obj.Result.MenuForWeek5.Meals.Weekly.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek5.Meals.Weekly;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek5.Meals.Seasonal.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek5.Meals.Seasonal;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek5.Meals.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek5.Meals.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    MenuForWeek1Names.Add(jsonObject.Menu[placeHolder].MealName);
                    MenuForWeek1Desc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    MenuForWeek1Prot.Add(jsonObject.Menu[placeHolder].MealProtein);
                    MenuForWeek1Sugar.Add(jsonObject.Menu[placeHolder].MealSugar);
                    MenuForWeek1Fat.Add(jsonObject.Menu[placeHolder].MealFat);

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        MenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObject.Menu[placeHolder].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObject.Menu[placeHolder].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (mealGroup5.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        mealGroup5.Remove(mealGroup5.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        mealGroup5.Add(holder);

                    }
                    else
                    {
                        mealGroup5.Add(holder);
                    }
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;
                    SeasMenuForWeek1Names.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealName);
                    SeasMenuForWeek1Desc.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc);
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSeasonal.Menu[placeHolderSeas].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }


=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (seasonalMealGroup5.Any(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        seasonalMealGroup5.Remove(seasonalMealGroup5.Where(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId).Single());
                        seasonalMealGroup5.Add(holder);

                    }
                    else
                    {
                        seasonalMealGroup5.Add(holder);
                    }
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    SmoothiesNames.Add(jsonObjectSmoothie.Menu[smooth].MealName);
                    SmoothiesDesc.Add(jsonObjectSmoothie.Menu[smooth].MealDesc);
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SmoothiesImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                        SmoothiesImage.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSmoothie.Menu[smooth].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }


=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (smoothieGroup5.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup5.Remove(smoothieGroup5.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup5.Add(holder);

                    }
                    else
                    {
                        smoothieGroup5.Add(holder);
                    }
                }

                grouped5.Add(mealGroup5);
                grouped5.Add(seasonalMealGroup5);
                grouped5.Add(smoothieGroup5);
            }
            else
            {
                var jsonObjectLength = obj.Result.MenuForWeek6.Meals.Weekly.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek6.Meals.Weekly;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek6.Meals.Seasonal.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek6.Meals.Seasonal;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek6.Meals.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek6.Meals.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    MenuForWeek1Names.Add(jsonObject.Menu[placeHolder].MealName);
                    MenuForWeek1Desc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    MenuForWeek1Prot.Add(jsonObject.Menu[placeHolder].MealProtein);
                    MenuForWeek1Sugar.Add(jsonObject.Menu[placeHolder].MealSugar);
                    MenuForWeek1Fat.Add(jsonObject.Menu[placeHolder].MealFat);

                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        MenuForWeek1Image.Add(imageMeal);
                    }
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObject.Menu[placeHolder].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObject.Menu[placeHolder].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }


                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (mealGroup.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        mealGroup6.Remove(mealGroup6.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        mealGroup6.Add(holder);

                    }
                    else
                    {
                        mealGroup6.Add(holder);
                    }
                }

                for (int placeHolderSeas = 0; placeHolderSeas < jsonObjectSeasonalLength; placeHolderSeas++)
                {
                    String imageMeal;
                    SeasMenuForWeek1Names.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealName);
                    SeasMenuForWeek1Desc.Add(jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc);
                    if (jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[placeHolderSeas].MealPhotoUrl.ToString();
                        SeasMenuForWeek1Image.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSeasonal.Menu[placeHolderSeas].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (seasonalMealGroup6.Any(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId))
                    {
                        seasonalMealGroup6.Remove(seasonalMealGroup6.Where(x => x.id == jsonObjectSeasonal.Menu[placeHolderSeas].MealId).Single());
                        seasonalMealGroup6.Add(holder);

                    }
                    else
                    {
                        seasonalMealGroup6.Add(holder);
                    }
                }

                for (int smooth = 0; smooth < jsonObjectSmoothieLength; smooth++)
                {
                    String imageMeal;
                    SmoothiesNames.Add(jsonObjectSmoothie.Menu[smooth].MealName);
                    SmoothiesDesc.Add(jsonObjectSmoothie.Menu[smooth].MealDesc);
                    if (jsonObjectSmoothie.Menu[smooth].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        SmoothiesImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[smooth].MealPhotoUrl.ToString();
                        SmoothiesImage.Add(imageMeal);
                    }

<<<<<<< HEAD
                    int quantityHolder;
                    if (quantityDictionary.ContainsKey(jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        quantityHolder = (int)quantityDictionary[jsonObjectSmoothie.Menu[smooth].MealId];
                    }
                    else
                    {
                        quantityHolder = 0;
                    }

=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = quantityHolder,
                        is_addon = "false",
                    };
<<<<<<< HEAD
                    mealsSelectedHere += holder.qty;
=======
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1

                    if (smoothieGroup6.Any(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId))
                    {
                        smoothieGroup6.Remove(smoothieGroup6.Where(x => x.id == jsonObjectSmoothie.Menu[smooth].MealId).Single());
                        smoothieGroup6.Add(holder);

                    }
                    else
                    {
                        smoothieGroup6.Add(holder);
                    }
                }

                grouped6.Add(mealGroup6);
                grouped6.Add(seasonalMealGroup6);
                grouped6.Add(smoothieGroup6);

            }

            System.Diagnostics.Debug.WriteLine("Numbers -> "  + mealsSelectedHere + " " + mealsAllowed);

            if (mealsSelectedHere.Equals(mealsAllowed))
            {
                saveNav.BackgroundColor = Color.FromHex(green);
            }

            var surpriseNav = new Button
            {
                Text = "Surprise"
            };
            surpriseNav.Clicked += ClickedSurprise;
            surpriseNav.BackgroundColor = Color.FromHex(def);

            var skipNav = new Button
            {
                Text = "Skip",
                ClassId = "MCSkip",
            };
            skipNav.Clicked += ClickedSkip;
            skipNav.BackgroundColor = Color.FromHex(def);

<<<<<<< HEAD
            var totalMeals = new Label();

            switch(weekNumber)
            {
                case 1:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - mealsSelectedHere + totalMealsSelected));
                    if(mealsAllowed - mealsSelectedHere + totalMealsSelected == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += returnBack;
                    }
                    break;
                case 2:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - mealsSelectedHere + totalMealsSelected2));
                    if (mealsAllowed - mealsSelectedHere + totalMealsSelected2 == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += returnBack;
                    }
                    break;
                case 3:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - mealsSelectedHere + totalMealsSelected3));
                    if (mealsAllowed - mealsSelectedHere + totalMealsSelected3 == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += returnBack;
                    }
                    break;
                case 4:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - mealsSelectedHere + totalMealsSelected4));
                    if (mealsAllowed - mealsSelectedHere + totalMealsSelected4 == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += returnBack;
                    }
                    break;
                case 5:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - mealsSelectedHere + totalMealsSelected5));
                    if (mealsAllowed - mealsSelectedHere + totalMealsSelected5 == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += returnBack;
                    }
                    break;
                case 6:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - mealsSelectedHere + totalMealsSelected6));
                    if (mealsAllowed - mealsSelectedHere + totalMealsSelected6 == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += returnBack;
                    }
=======
            var saveNav = new Button
            {
                Text = "Save"
            };

            if(weekNumber == 1 && totalMealsSelected == mealsAllowed)
            {
                saveNav.BackgroundColor = Color.FromHex(green);
                saveNav.Clicked += returnBack;
            }
            else if(weekNumber == 2 && totalMealsSelected2 == mealsAllowed)
            {
                saveNav.BackgroundColor = Color.FromHex(green);
                saveNav.Clicked += returnBack;


            }
            else if (weekNumber == 3 && totalMealsSelected3 == mealsAllowed)
            {
                saveNav.BackgroundColor = Color.FromHex(green);
                saveNav.Clicked += returnBack;


            }
            else if (weekNumber == 4 && totalMealsSelected4 == mealsAllowed)
            {
                saveNav.BackgroundColor = Color.FromHex(green);
                saveNav.Clicked += returnBack;


            }
            else if (weekNumber == 5 && totalMealsSelected5 == mealsAllowed)
            {
                saveNav.BackgroundColor = Color.FromHex(green);
                saveNav.Clicked += returnBack;


            }
            else if (weekNumber == 6 && totalMealsSelected6 == mealsAllowed)
            {
                saveNav.BackgroundColor = Color.FromHex(green);
                saveNav.Clicked += returnBack;
            }
            else
            {
                saveNav.BackgroundColor = Color.FromHex(def);
            }

            var totalMeals = new Label();

            switch(weekNumber)
            {
                case 1:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected));
                    break;
                case 2:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected2));
                    break;
                case 3:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected3));
                    break;
                case 4:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected4));
                    break;
                case 5:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected5));
                    break;
                case 6:
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected6));
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                    break;
                default:
                    break;
            }   

            Grid sl = new Grid();

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

            if(weekNumber == 1)
            {
                lstView.ItemsSource = grouped;
            }
            else if(weekNumber == 2)
            {
                lstView.ItemsSource = grouped2;
            }
            else if(weekNumber == 3)
            {
                lstView.ItemsSource = grouped3;
            }
            else if(weekNumber == 4)
            {
                lstView.ItemsSource = grouped4;
            }
            else if(weekNumber == 5)
            {
                lstView.ItemsSource = grouped5;
            }
            else
            {
                lstView.ItemsSource = grouped6;
            }

            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");
            lstView.GroupShortNameBinding = new Binding("ShortName");


            lstView.ItemTemplate = new DataTemplate(() =>
            {
                var grid = new Grid
                {
                    HeightRequest = 100,
                    VerticalOptions = LayoutOptions.FillAndExpand,
                    
                };
                var nameLabel = new Label
                {
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

<<<<<<< HEAD
                var infoButton = new ImageButton
                {
                    WidthRequest = 20,
                    HeightRequest = 20,
=======
                /*
                quantity = new Label
                {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center
                };
                */

                var infoButton = new ImageButton
                {
                    WidthRequest = 20,
                    HeightRequest = 20,
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
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

                var steppers = new Stepper
                {
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

                    if (weekNumber == 1)
                    {
<<<<<<< HEAD

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

                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

=======
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

                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        }
                        else
                        {
                            // Replace value in dictionary if key exists
                            if (mealQtyDict.ContainsKey(model.id))
                            {
                                mealQtyDict.Remove(model.id);
                            }
                            mealQtyDict.Add(model.id, model.qty);
                        }
<<<<<<< HEAD
                       totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected));
                        if (mealsAllowed - totalMealsSelected - mealsSelectedHere == 0)
=======
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected));
                        if (mealsAllowed - totalMealsSelected == 0)
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        {
                            saveNav.BackgroundColor = Color.FromHex(green);
                            saveNav.Clicked += postData;
                        }
                        else
                        {
                            saveNav.BackgroundColor = Color.FromHex(def);
                        }
                    }
                    else if (weekNumber == 2)
                    {
                        if (stepperVal > model.qty)
                        {
                            model.qty = (int)steppers.Value;
                            totalMealsSelected2 += 1;
                            model.order_qty += 1;

<<<<<<< HEAD
                        if (stepperVal > model.qty)
                        {
                            model.qty = (int)steppers.Value;
                            totalMealsSelected2 += 1;
                            model.order_qty += 1;

                        }
                        else if (stepperVal < model.qty)
                        {

                            model.qty = (int)steppers.Value;
                            totalMealsSelected2 -= 1;
                            model.order_qty -= 1;
                            if (model.qty < 0)
                            {
                                model.order_qty = 0;
                                totalMealsSelected2 = 0;
                            }
                        }

=======
                        }
                        else if (stepperVal < model.qty)
                        {

                            model.qty = (int)steppers.Value;
                            totalMealsSelected2 -= 1;
                            model.order_qty -= 1;
                            if (model.qty < 0)
                            {
                                model.order_qty = 0;
                                totalMealsSelected2 = 0;
                            }
                        }

>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

                        }
                        else
                        {
                            // Replace value in dictionary if key exists
                            if (mealQtyDict.ContainsKey(model.id))
                            {
                                mealQtyDict.Remove(model.id);
                            }
                            mealQtyDict.Add(model.id, model.qty);
                        }
<<<<<<< HEAD
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected2 - 1));
=======
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected2));
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        if (mealsAllowed - totalMealsSelected2 == 0)
                        {
                            saveNav.BackgroundColor = Color.FromHex(green);
                            saveNav.Clicked += postData;
                        }
                        else
                        {
                            saveNav.BackgroundColor = Color.FromHex(def);
                        }
                    }
                    else if (weekNumber == 3)
                    {
                        if (stepperVal > model.qty)
                        {
                            model.qty = (int)steppers.Value;
                            totalMealsSelected3 += 1;
                            model.order_qty += 1;

                        }
                        else if (stepperVal < model.qty)
                        {

                            model.qty = (int)steppers.Value;
                            totalMealsSelected3 -= 1;
                            model.order_qty -= 1;
                            if (model.qty < 0)
                            {
                                model.order_qty = 0;
                                totalMealsSelected3 = 0;
                            }
                        }

                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

                        }
                        else
                        {
                            // Replace value in dictionary if key exists
                            if (mealQtyDict.ContainsKey(model.id))
                            {
                                mealQtyDict.Remove(model.id);
                            }
                            mealQtyDict.Add(model.id, model.qty);
                        }
<<<<<<< HEAD
                        //totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected3));
=======
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected3));
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        if (mealsAllowed - totalMealsSelected3 == 0)
                        {
                            saveNav.BackgroundColor = Color.FromHex(green);
                            saveNav.Clicked += postData;
                        }
                        else
                        {
                            saveNav.BackgroundColor = Color.FromHex(def);
                        }
                    }
                    else if (weekNumber == 4)
                    {
                        if (stepperVal > model.qty)
                        {
                            model.qty = (int)steppers.Value;
                            totalMealsSelected4 += 1;
                            model.order_qty += 1;

                        }
                        else if (stepperVal < model.qty)
                        {

                            model.qty = (int)steppers.Value;
                            totalMealsSelected4 -= 1;
                            model.order_qty -= 1;
                            if (model.qty < 0)
                            {
                                model.order_qty = 0;
                                totalMealsSelected4 = 0;
                            }
                        }

                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

                        }
                        else
                        {
                            // Replace value in dictionary if key exists
                            if (mealQtyDict.ContainsKey(model.id))
                            {
                                mealQtyDict.Remove(model.id);
                            }
                            mealQtyDict.Add(model.id, model.qty);
                        }
<<<<<<< HEAD
                       // totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected4));
=======
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected4));
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        if (mealsAllowed - totalMealsSelected4 == 0)
                        {
                            saveNav.BackgroundColor = Color.FromHex(green);
                            saveNav.Clicked += postData;
                        }
                        else
                        {
                            saveNav.BackgroundColor = Color.FromHex(def);
                        }
                    }
                    else if (weekNumber == 5)
                    {
                        if (stepperVal > model.qty)
                        {
                            model.qty = (int)steppers.Value;
                            totalMealsSelected5 += 1;
                            model.order_qty += 1;

                        }
                        else if (stepperVal < model.qty)
                        {

                            model.qty = (int)steppers.Value;
                            totalMealsSelected5 -= 1;
                            model.order_qty -= 1;
                            if (model.qty < 0)
                            {
                                model.order_qty = 0;
                                totalMealsSelected5 = 0;
                            }
                        }

                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

                        }
                        else
                        {
                            // Replace value in dictionary if key exists
                            if (mealQtyDict.ContainsKey(model.id))
                            {
                                mealQtyDict.Remove(model.id);
                            }
                            mealQtyDict.Add(model.id, model.qty);
                        }
<<<<<<< HEAD
                        //totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected5));
=======
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected5));
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        if (mealsAllowed - totalMealsSelected5 == 0)
                        {
                            saveNav.BackgroundColor = Color.FromHex(green);
                            saveNav.Clicked += postData;
                        }
                        else
                        {
                            saveNav.BackgroundColor = Color.FromHex(def);
                        }
                    }
                    else if (weekNumber == 6)
                    {
                        if (stepperVal > model.qty)
                        {
                            model.qty = (int)steppers.Value;
                            totalMealsSelected6 += 1;
                            model.order_qty += 1;

                        }
                        else if (stepperVal < model.qty)
                        {

                            model.qty = (int)steppers.Value;
                            totalMealsSelected6 -= 1;
                            model.order_qty -= 1;
                            if (model.qty < 0)
                            {
                                model.order_qty = 0;
                                totalMealsSelected6 = 0;
                            }
                        }

                        if (model.qty <= 0)
                        {
                            mealQtyDict.Remove(model.id);

                        }
                        else
                        {
                            // Replace value in dictionary if key exists
                            if (mealQtyDict.ContainsKey(model.id))
                            {
                                mealQtyDict.Remove(model.id);
                            }
                            mealQtyDict.Add(model.id, model.qty);
                        }
<<<<<<< HEAD
                        //totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected6));
=======
                        totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected6));
>>>>>>> 587cc99d562bebaec6b6120b5b5ad80127d068a1
                        if (mealsAllowed - totalMealsSelected6 == 0)
                        {
                            saveNav.BackgroundColor = Color.FromHex(green);
                            saveNav.Clicked += postData;
                        }
                        else
                        {
                            saveNav.BackgroundColor = Color.FromHex(def);
                        }
                    };
                };

                quantity = new Label
                {
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

        private void SaveNav_Clicked(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        public async void postData(object sender, EventArgs e)
        {
            HttpClient client = new HttpClient();
            MealSchedule ms = new MealSchedule();

            // Getter Information
            int weekNumber = ms.getNum();
            string postUrl = ms.getPlanPicked();
            string pid = ms.getPlanNumPicked();

            List<DateTimeOffset> weekAffectedList = ms.getWeekList();    // Week Affected Dates
            string[] deliveryDayList = ms.getDDArray();                  // Delivery Days ( 6 of them )

            var mealSelectInfoToSend = new MealSelectInformation
            {
                PurchaseId = pid,                  // Constant for now
                WeekAffected = weekAffectedList[weekNumber - 1],            // Week affected - DONE
                MealQuantities = mealQtyDict,               // Dictionary inserted - DONE
                DeliveryDay = deliveryDayList[0],               // Day selected - DONE
                DefaultSelected = false,             // Always False unless Surprise - DONE
                IsAddons = false                    // Always False - DONE

            };

            if (mealQtyDict.Count == 0)
            {
                colorToReturn = Color.FromHex(def);
                ClickedSave();
            }
            else
            {

                foreach (var pk in mealQtyDict)
                {
                    System.Diagnostics.Debug.WriteLine("Dictionary Count " + pk);
                }
                System.Diagnostics.Debug.WriteLine("Dictionary Count " + mealQtyDict.Count);
                string mealSelectInfoJson = JsonConvert.SerializeObject(mealSelectInfoToSend); // convert to json

                try
                {
                    var httpContent = new StringContent(mealSelectInfoJson, Encoding.UTF8, "application/json"); // create a http response to send
                    var response = await client.PostAsync(postUrl, httpContent); // send the json file to database
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

                colorToReturn = Color.FromHex(green);

                ClickedSave();
            }
        }

        public void getPurchID()
        {
            WebClient client = new WebClient();
            // Get user zipcodes
            var userPurchClient = client.DownloadString(acctUrl + userID);
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
            MealSchedule ms = new MealSchedule();
            int weekNumber = ms.getNum();
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
            MealSchedule ms = new MealSchedule();
            int weekNumber = ms.getNum();
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
            MealSchedule ms = new MealSchedule();
            int weekNumber = ms.getNum();
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