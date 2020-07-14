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

namespace InfiniteMeals.MealSelect
{

    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MealChoices : ContentPage
    {
        public List<String> purchaseIdList = new List<String>();
        public  int totalMealsSelected;
        private static ObservableCollection<MealGroup> grouped { get; set; }
        public  IList<Meal> Meals { get; private set; }
        public  IList<Meal> SeasonalMeals { get; private set; }
        public  IList<Meal> Smoothies { get; private set; }
        public  IList<Meal> AllMeals { get; private set; }
        public  IList<Meal> MealSelectionList { get; private set; }
        public  Dictionary<string, int?> mealQtyDict = new Dictionary<string, int?>();
        public  static Label quantity;
        public  MealGroup mealGroup = new MealGroup() { LongName = "Meals", ShortName = "m" };
        public  MealGroup seasonalMealGroup = new MealGroup() { LongName = "Seasonal Meals", ShortName = "sm" };
        public  MealGroup smoothieGroup = new MealGroup() { LongName = "Smoothies", ShortName = "s" };
        public static string infoImg = "info.jpg";
        public static string green = "#8FBC8F";
        public static string def = "#F5F5F5";
        public Color colorToReturn = Color.FromHex("#F5F5F5");
        private static string mealsUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals";
        private static string acctUrl = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/accountpurchases/100-000016";

        public MealChoices()
        {
            InitializeComponent();
            getPurchID();
            getData();
        }

        public void getData()
        {
            MealSchedule ms = new MealSchedule();
            long mealsAllowed = ms.getMaxMeals();
            int weekNumber = ms.getNum();

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

            WebClient client = new WebClient();
            var content = client.DownloadString(mealsUrl);
            var obj = JsonConvert.DeserializeObject<Data>(content);

            if(weekNumber == 0)
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

                    mealGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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

                    seasonalMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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
                    smoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
                }

                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);
            }
            else if (weekNumber == 1)
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

                    mealGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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

                    seasonalMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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
                    smoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
                }

                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);

            }
            else if (weekNumber == 2)
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

                    mealGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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

                    seasonalMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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
                    smoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
                }

                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);
            }
            else if(weekNumber == 3)
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

                    mealGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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

                    seasonalMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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
                    smoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
                }

                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);
            }
            else if (weekNumber == 4)
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

                    mealGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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

                    seasonalMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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
                    smoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
                }

                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);
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

                    mealGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = jsonObject.Menu[placeHolder].MealName,
                        description = jsonObject.Menu[placeHolder].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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

                    seasonalMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[placeHolderSeas].MealId,
                        name = jsonObjectSeasonal.Menu[placeHolderSeas].MealName,
                        description = jsonObjectSeasonal.Menu[placeHolderSeas].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
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
                    smoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[smooth].MealId,
                        name = jsonObjectSmoothie.Menu[smooth].MealName,
                        description = jsonObjectSmoothie.Menu[smooth].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = 0,
                        is_addon = "false",
                    });
                }

                grouped.Add(mealGroup);
                grouped.Add(seasonalMealGroup);
                grouped.Add(smoothieGroup);

            }

            var surpriseNav = new Button
            {
                Text = "Surprise"
            };
            surpriseNav.Clicked += ClickedSurprise;
            surpriseNav.BackgroundColor = Color.FromHex(def);

            var skipNav = new Button
            {
                Text = "Skip"
            };
            skipNav.Clicked += ClickedSkip;
            skipNav.BackgroundColor = Color.FromHex(def);

            var saveNav = new Button
            {
                Text = "Save"
            };
            saveNav.BackgroundColor = Color.FromHex(def);

            var totalMeals = new Label
            {
                Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected))
            };

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

                var steppers = new Stepper
                {
                    Maximum = mealsAllowed,
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
                    totalMeals.Text = string.Format("Please Select {0} Meals", (mealsAllowed - totalMealsSelected));

                    if (mealsAllowed - totalMealsSelected == 0)
                    {
                        saveNav.BackgroundColor = Color.FromHex(green);
                        saveNav.Clicked += postData;
                    }
                    else
                    {
                        saveNav.BackgroundColor = Color.FromHex(def);
                    }
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

            if(mealQtyDict.Count == 0)
            {
                colorToReturn = Color.FromHex(def);
                ClickedSave(sender, e);
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

                ClickedSave(sender, e);
            }
        }

        public void getPurchID()
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
            if(weekNumber == 1)
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
            else if(weekNumber == 2)
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
            MealSchedule ms = new MealSchedule();
            int weekNumber = ms.getNum();
            System.Diagnostics.Debug.WriteLine("CLICKED SKIP HERE " + weekNumber);

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

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton"), e);

                }
                await Navigation.PopAsync();
            }
            else if(weekNumber == 2)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton2");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton2");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton2");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton2");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton2");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton2"), e);

                }
                await Navigation.PopAsync();
            }
            else if(weekNumber == 3)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton3");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton3");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton3");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton3");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton3");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                    ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton3"), e);

                }
                await Navigation.PopAsync();
            }
            else if(weekNumber == 4)
            {
                if (this.BindingContext != null)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button skip1 = (Button)mealSchedulePage.FindByName("SkipButton4");
                    Button sel1 = (Button)mealSchedulePage.FindByName("SelectButton4");
                    Button sun1 = (Button)mealSchedulePage.FindByName("SundayButton4");
                    Button mon1 = (Button)mealSchedulePage.FindByName("MondayButton4");
                    Button surp1 = (Button)mealSchedulePage.FindByName("SurpriseButton4");

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
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

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
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

                    skip1.BackgroundColor = Color.FromHex(green);
                    sel1.BackgroundColor = Color.FromHex(def);
                    sun1.BackgroundColor = Color.FromHex(def);
                    mon1.BackgroundColor = Color.FromHex(def);
                    surp1.BackgroundColor = Color.FromHex(def);
                   ms.postSkipData((Button)mealSchedulePage.FindByName("SkipButton6"), e);

                }
                await Navigation.PopAsync();
            }
        }

        private async void ClickedSave(object sender, EventArgs e)
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
            
    }

}
 