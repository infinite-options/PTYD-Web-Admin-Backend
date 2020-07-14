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
using System.Windows.Input;
using Xamarin.Forms.Internals;
using InfiniteMeals.Meals;
using System.Net;

namespace InfiniteMeals.ViewModel.MealSelect
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AddOnChoices : ContentPage
    {
        public Dictionary<string, int> mealQtyDict = new Dictionary<string, int>();
        private ObservableCollection<MealGroup> grouped { get; set; }
        String infoImg = "info.jpg";
        double subTotal = 0.00;
        public static string yellow = "#FFE573";
        public static string def = "#F5F5F5";
        public Color colorToReturn = Color.FromHex("#F5F5F5");

        public AddOnChoices()
        {
            InitializeComponent();
            getData();

        }

        public void getData()
        {
            MealSchedule ms = new MealSchedule();
            int weekNumber = ms.getNum();
            // Normal Meals
            List<String> AddNames = new List<String>();
            List<String> AddDesc = new List<String>();
            List<double> AddPrice = new List<double>();
            List<int> AddQty = new List<int>();
            List<String> AddImage = new List<String>();

            // Additional Meals
            List<String> AddMealName = new List<String>();
            List<String> AddMealDesc = new List<String>();
            List<double> AddMealPrice = new List<double>();
            List<String> AddMealImage = new List<String>();
            List<int> AddMealQty = new List<int>();

            // Additional Smoothies
            List<String> AddSmoothiesName = new List<String>();
            List<String> AddSmoothiesDesc = new List<String>();
            List<double> AddSmoothiesPrice = new List<double>();
            List<String> AddSmoothiesImage = new List<String>();
            List<int> AddSmoothieQty = new List<int>();

            // Grouping
            grouped = new ObservableCollection<MealGroup>();
            var addAddOnGroup = new MealGroup() { LongName = "Add Ons", ShortName = "am" };
            var addMealGroup = new MealGroup() { LongName = "Additional Meals", ShortName = "asm" };
            var addSmoothieGroup = new MealGroup() { LongName = "Additional Smoothies", ShortName = "as" };

            WebClient client = new WebClient();
            var content =  client.DownloadString("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);

            if (weekNumber == 0)
            {
                var jsonObjectLength = obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek1.Addons.AddonsAddons;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek1.Addons.Weekly.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek1.Addons.Weekly;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek1.Addons.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek1.Addons.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    AddNames.Add(jsonObject.Menu[placeHolder].MealName);
                    AddDesc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    AddPrice.Add(Convert.ToDouble(jsonObject.Menu[placeHolder].ExtraMealPrice));
                    AddQty.Add(0);
                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        AddImage.Add(imageMeal);

                    }

                    addAddOnGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    });
                }

                for (int j = 0; j < jsonObjectSeasonalLength; j++)
                {
                    String imageMeal;
                    AddMealName.Add(jsonObjectSeasonal.Menu[j].MealName);
                    AddMealDesc.Add(jsonObjectSeasonal.Menu[j].MealDesc);
                    AddMealPrice.Add(Convert.ToDouble(jsonObjectSeasonal.Menu[j].ExtraMealPrice));
                    AddMealQty.Add(0);
                    if (jsonObjectSeasonal.Menu[j].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddMealImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[j].MealPhotoUrl.ToString();
                        AddMealImage.Add(imageMeal);

                    }
                    addMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    });
                }

                for (int k = 0; k < jsonObjectSmoothieLength; k++)
                {
                    String imageMeal;
                    AddSmoothiesName.Add(jsonObjectSmoothie.Menu[k].MealName);
                    AddSmoothiesDesc.Add(jsonObjectSmoothie.Menu[k].MealDesc);
                    AddSmoothiesPrice.Add(Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice));
                    AddSmoothieQty.Add(0);
                    if (jsonObjectSmoothie.Menu[k].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddSmoothiesImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[k].MealPhotoUrl.ToString();
                        AddSmoothiesImage.Add(imageMeal);
                    }
                    addSmoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    });

                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }
            else if(weekNumber == 1)
            {
                var jsonObjectLength = obj.Result.MenuForWeek2.Addons.AddonsAddons.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek2.Addons.AddonsAddons;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek2.Addons.Weekly.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek2.Addons.Weekly;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek2.Addons.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek2.Addons.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    AddNames.Add(jsonObject.Menu[placeHolder].MealName);
                    AddDesc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    AddPrice.Add(Convert.ToDouble(jsonObject.Menu[placeHolder].ExtraMealPrice));
                    AddQty.Add(0);
                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        AddImage.Add(imageMeal);

                    }

                    addAddOnGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    });
                }

                for (int j = 0; j < jsonObjectSeasonalLength; j++)
                {
                    String imageMeal;
                    AddMealName.Add(jsonObjectSeasonal.Menu[j].MealName);
                    AddMealDesc.Add(jsonObjectSeasonal.Menu[j].MealDesc);
                    AddMealPrice.Add(Convert.ToDouble(jsonObjectSeasonal.Menu[j].ExtraMealPrice));
                    AddMealQty.Add(0);
                    if (jsonObjectSeasonal.Menu[j].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddMealImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[j].MealPhotoUrl.ToString();
                        AddMealImage.Add(imageMeal);

                    }
                    addMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    });
                }

                for (int k = 0; k < jsonObjectSmoothieLength; k++)
                {
                    String imageMeal;
                    AddSmoothiesName.Add(jsonObjectSmoothie.Menu[k].MealName);
                    AddSmoothiesDesc.Add(jsonObjectSmoothie.Menu[k].MealDesc);
                    AddSmoothiesPrice.Add(Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice));
                    AddSmoothieQty.Add(0);
                    if (jsonObjectSmoothie.Menu[k].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddSmoothiesImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[k].MealPhotoUrl.ToString();
                        AddSmoothiesImage.Add(imageMeal);
                    }
                    addSmoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    });

                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }
            else if (weekNumber == 2)
            {
                var jsonObjectLength = obj.Result.MenuForWeek3.Addons.AddonsAddons.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek3.Addons.AddonsAddons;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek3.Addons.Weekly.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek3.Addons.Weekly;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek3.Addons.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek3.Addons.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    AddNames.Add(jsonObject.Menu[placeHolder].MealName);
                    AddDesc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    AddPrice.Add(Convert.ToDouble(jsonObject.Menu[placeHolder].ExtraMealPrice));
                    AddQty.Add(0);
                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        AddImage.Add(imageMeal);

                    }

                    addAddOnGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    });
                }

                for (int j = 0; j < jsonObjectSeasonalLength; j++)
                {
                    String imageMeal;
                    AddMealName.Add(jsonObjectSeasonal.Menu[j].MealName);
                    AddMealDesc.Add(jsonObjectSeasonal.Menu[j].MealDesc);
                    AddMealPrice.Add(Convert.ToDouble(jsonObjectSeasonal.Menu[j].ExtraMealPrice));
                    AddMealQty.Add(0);
                    if (jsonObjectSeasonal.Menu[j].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddMealImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[j].MealPhotoUrl.ToString();
                        AddMealImage.Add(imageMeal);

                    }
                    addMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    });
                }

                for (int k = 0; k < jsonObjectSmoothieLength; k++)
                {
                    String imageMeal;
                    AddSmoothiesName.Add(jsonObjectSmoothie.Menu[k].MealName);
                    AddSmoothiesDesc.Add(jsonObjectSmoothie.Menu[k].MealDesc);
                    AddSmoothiesPrice.Add(Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice));
                    AddSmoothieQty.Add(0);
                    if (jsonObjectSmoothie.Menu[k].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddSmoothiesImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[k].MealPhotoUrl.ToString();
                        AddSmoothiesImage.Add(imageMeal);
                    }
                    addSmoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    });

                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }
            else if(weekNumber == 3)
            {
                var jsonObjectLength = obj.Result.MenuForWeek4.Addons.AddonsAddons.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek4.Addons.AddonsAddons;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek4.Addons.Weekly.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek4.Addons.Weekly;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek4.Addons.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek4.Addons.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    AddNames.Add(jsonObject.Menu[placeHolder].MealName);
                    AddDesc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    AddPrice.Add(Convert.ToDouble(jsonObject.Menu[placeHolder].ExtraMealPrice));
                    AddQty.Add(0);
                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        AddImage.Add(imageMeal);

                    }

                    addAddOnGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    });
                }

                for (int j = 0; j < jsonObjectSeasonalLength; j++)
                {
                    String imageMeal;
                    AddMealName.Add(jsonObjectSeasonal.Menu[j].MealName);
                    AddMealDesc.Add(jsonObjectSeasonal.Menu[j].MealDesc);
                    AddMealPrice.Add(Convert.ToDouble(jsonObjectSeasonal.Menu[j].ExtraMealPrice));
                    AddMealQty.Add(0);
                    if (jsonObjectSeasonal.Menu[j].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddMealImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[j].MealPhotoUrl.ToString();
                        AddMealImage.Add(imageMeal);

                    }
                    addMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    });
                }

                for (int k = 0; k < jsonObjectSmoothieLength; k++)
                {
                    String imageMeal;
                    AddSmoothiesName.Add(jsonObjectSmoothie.Menu[k].MealName);
                    AddSmoothiesDesc.Add(jsonObjectSmoothie.Menu[k].MealDesc);
                    AddSmoothiesPrice.Add(Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice));
                    AddSmoothieQty.Add(0);
                    if (jsonObjectSmoothie.Menu[k].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddSmoothiesImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[k].MealPhotoUrl.ToString();
                        AddSmoothiesImage.Add(imageMeal);
                    }
                    addSmoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    });

                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }
            else if(weekNumber == 4)
            {
                var jsonObjectLength = obj.Result.MenuForWeek5.Addons.AddonsAddons.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek5.Addons.AddonsAddons;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek5.Addons.Weekly.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek5.Addons.Weekly;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek5.Addons.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek5.Addons.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    AddNames.Add(jsonObject.Menu[placeHolder].MealName);
                    AddDesc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    AddPrice.Add(Convert.ToDouble(jsonObject.Menu[placeHolder].ExtraMealPrice));
                    AddQty.Add(0);
                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        AddImage.Add(imageMeal);

                    }

                    addAddOnGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    });
                }

                for (int j = 0; j < jsonObjectSeasonalLength; j++)
                {
                    String imageMeal;
                    AddMealName.Add(jsonObjectSeasonal.Menu[j].MealName);
                    AddMealDesc.Add(jsonObjectSeasonal.Menu[j].MealDesc);
                    AddMealPrice.Add(Convert.ToDouble(jsonObjectSeasonal.Menu[j].ExtraMealPrice));
                    AddMealQty.Add(0);
                    if (jsonObjectSeasonal.Menu[j].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddMealImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[j].MealPhotoUrl.ToString();
                        AddMealImage.Add(imageMeal);

                    }
                    addMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    });
                }

                for (int k = 0; k < jsonObjectSmoothieLength; k++)
                {
                    String imageMeal;
                    AddSmoothiesName.Add(jsonObjectSmoothie.Menu[k].MealName);
                    AddSmoothiesDesc.Add(jsonObjectSmoothie.Menu[k].MealDesc);
                    AddSmoothiesPrice.Add(Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice));
                    AddSmoothieQty.Add(0);
                    if (jsonObjectSmoothie.Menu[k].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddSmoothiesImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[k].MealPhotoUrl.ToString();
                        AddSmoothiesImage.Add(imageMeal);
                    }
                    addSmoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    });

                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }
            else
            {
                var jsonObjectLength = obj.Result.MenuForWeek6.Addons.AddonsAddons.Menu.Length;
                var jsonObject = obj.Result.MenuForWeek6.Addons.AddonsAddons;
                var jsonObjectSeasonalLength = obj.Result.MenuForWeek6.Addons.Weekly.Menu.Length;
                var jsonObjectSeasonal = obj.Result.MenuForWeek6.Addons.Weekly;
                var jsonObjectSmoothieLength = obj.Result.MenuForWeek6.Addons.Smoothies.Menu.Length;
                var jsonObjectSmoothie = obj.Result.MenuForWeek6.Addons.Smoothies;

                for (int placeHolder = 0; placeHolder < jsonObjectLength; placeHolder++)
                {
                    String imageMeal;
                    AddNames.Add(jsonObject.Menu[placeHolder].MealName);
                    AddDesc.Add(jsonObject.Menu[placeHolder].MealDesc);
                    AddPrice.Add(Convert.ToDouble(jsonObject.Menu[placeHolder].ExtraMealPrice));
                    AddQty.Add(0);
                    if (jsonObject.Menu[placeHolder].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddImage.Add(imageMeal);
                    }
                    else
                    {
                        imageMeal = jsonObject.Menu[placeHolder].MealPhotoUrl.ToString();
                        AddImage.Add(imageMeal);

                    }

                    addAddOnGroup.Add(new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    });
                }

                for (int j = 0; j < jsonObjectSeasonalLength; j++)
                {
                    String imageMeal;
                    AddMealName.Add(jsonObjectSeasonal.Menu[j].MealName);
                    AddMealDesc.Add(jsonObjectSeasonal.Menu[j].MealDesc);
                    AddMealPrice.Add(Convert.ToDouble(jsonObjectSeasonal.Menu[j].ExtraMealPrice));
                    AddMealQty.Add(0);
                    if (jsonObjectSeasonal.Menu[j].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddMealImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSeasonal.Menu[j].MealPhotoUrl.ToString();
                        AddMealImage.Add(imageMeal);

                    }
                    addMealGroup.Add(new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    });
                }

                for (int k = 0; k < jsonObjectSmoothieLength; k++)
                {
                    String imageMeal;
                    AddSmoothiesName.Add(jsonObjectSmoothie.Menu[k].MealName);
                    AddSmoothiesDesc.Add(jsonObjectSmoothie.Menu[k].MealDesc);
                    AddSmoothiesPrice.Add(Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice));
                    AddSmoothieQty.Add(0);
                    if (jsonObjectSmoothie.Menu[k].MealPhotoUrl == null)
                    {
                        imageMeal = "defaultmeal.png";
                        AddSmoothiesImage.Add(imageMeal);

                    }
                    else
                    {
                        imageMeal = jsonObjectSmoothie.Menu[k].MealPhotoUrl.ToString();
                        AddSmoothiesImage.Add(imageMeal);
                    }
                    addSmoothieGroup.Add(new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    });

                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }

            ToolbarItem totalBar = new ToolbarItem
            {
                Text = "Close",
                Order = ToolbarItemOrder.Primary,
                Priority = 0,
            };
            //totalBar.Clicked += GetText;
            totalBar.Clicked += postData;
            this.ToolbarItems.Add(totalBar);

            lstView.ItemsSource = grouped;
            lstView.SelectionMode = ListViewSelectionMode.None;
            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");
            lstView.GroupShortNameBinding = new Binding("ShortName");

            lstView.ItemTemplate = new DataTemplate(() =>
            {
            var grid = new Grid
            {
                HeightRequest = 100,
                VerticalOptions = LayoutOptions.FillAndExpand
            };
            var nameLabel = new Label
            {
                FontAttributes = FontAttributes.Bold,
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center
            };
            var costLabel = new Label
            {
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center
            };
            var imgLabel = new Image
            {
                WidthRequest = 150,
                HeightRequest = 75,
                Aspect = Aspect.AspectFill,
                HorizontalOptions = LayoutOptions.CenterAndExpand,
                VerticalOptions = LayoutOptions.CenterAndExpand
            };
            imgLabel.Margin = new Thickness(10, 0, 0, 10);
            var infoButton = new ImageButton
            {
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
                Value = 0,
                Maximum = 10,
                Increment = 1,
                HeightRequest = 50,
                Scale = 0.5,
                HorizontalOptions = LayoutOptions.End,
                VerticalOptions = LayoutOptions.Center,

            };
            steppers.Margin = new Thickness(40, 0, 0, 0); ;

            steppers.ValueChanged += (sender, e) =>
            {
                Stepper stepper = sender as Stepper;
                var model = stepper.BindingContext as Meal;
                var stepperVal = stepper.Value;


                if (stepperVal > model.qty)
                {
                    model.qty = (int)steppers.Value;
                    subTotal += model.price;
                    model.total = subTotal;
                }
                else if (stepperVal < model.qty)
                {

                    model.qty = (int)steppers.Value;
                    subTotal -= model.price;
                    model.total = subTotal;
                    if (subTotal < 0)
                    {
                        subTotal = 0.00;
                        model.total = subTotal;
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

                if (subTotal == 0)
                {
                    totalBar.Text = "Close";
                }
                else
                {
                    totalBar.Text = string.Format("Agree to Pay: ${0:#,0.00}", subTotal);
                }


            };

                Label quantity = new Label
                {
                    FontSize = 15,
                    FontAttributes = FontAttributes.Bold,
                    HorizontalOptions = LayoutOptions.Start,
                    VerticalOptions = LayoutOptions.Center,
                    VerticalTextAlignment = TextAlignment.Center,
                    HorizontalTextAlignment = TextAlignment.Center,

                };

                nameLabel.SetBinding(Label.TextProperty, "name");
                costLabel.SetBinding(Label.TextProperty, "price");
                quantity.SetBinding(Label.TextProperty, "qty");
                costLabel.SetBinding(Label.TextProperty, "price");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                infoButton.SetBinding(Image.SourceProperty, "infoUrl");

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
            int weekNumber = ms.getNum();
            string postUrl = ms.getPlanPicked();
            string pid = ms.getPlanNumPicked();

            // Getter Information
            List<DateTimeOffset> weekAffectedList = ms.getWeekList();    // Week Affected Dates
            string[] deliveryDayList = ms.getDDArray();                  // Delivery Days ( 6 of them )
            Dictionary<string, int> emptyDict = new Dictionary<string, int>();
            emptyDict.Add("", 0);

            // If no add ons
            if (mealQtyDict.Count == 0)
            {
                colorToReturn = Color.FromHex(def);
                var mealSelectInfoToSend = new AddonInfo
                {
                    PurchaseId = pid,                  // Constant for now
                    WeekAffected = weekAffectedList[weekNumber - 1].ToString("yyyy-MM-dd"),            // Week affected - DONE
                    AddonQuantities = emptyDict,               // Dictionary inserted - DONE
                    IsAddons = true,                    // Always False - DONE

                };
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

                colorToReturn = Color.FromHex(yellow);

                if (this.BindingContext != null)
                {
                    if(weekNumber == 1)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton");
                        test.BackgroundColor = Color.FromHex(def);
                    }
                    else if (weekNumber == 2)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton2");
                        test.BackgroundColor = Color.FromHex(def);
                    }
                    else if (weekNumber == 3)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton3");
                        test.BackgroundColor = Color.FromHex(def);
                    }
                    else if (weekNumber == 4)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton4");
                        test.BackgroundColor = Color.FromHex(def);
                    }
                    else if (weekNumber == 5)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton5");
                        test.BackgroundColor = Color.FromHex(def);
                    }
                    else if (weekNumber == 6)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton6");
                        test.BackgroundColor = Color.FromHex(def);
                    }

                }
                BackToSchedule(sender, e);

            }
            // If the add ons are not empty
            else
            {
                var mealSelectInfoToSend = new AddonInfo
                {
                    PurchaseId = pid,                  // Constant for now
                    WeekAffected = weekAffectedList[weekNumber - 1].ToString("yyyy-MM-dd"),            // Week affected - DONE
                    AddonQuantities = mealQtyDict,               // Dictionary inserted - DONE
                    IsAddons = true,                    // Always False - DONE

                };
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

                colorToReturn = Color.FromHex(yellow);

                if (weekNumber == 1)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton");
                    test.BackgroundColor = Color.FromHex(yellow);
                }
                else if (weekNumber == 2)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton2");
                    test.BackgroundColor = Color.FromHex(yellow);
                }
                else if (weekNumber == 3)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton3");
                    test.BackgroundColor = Color.FromHex(yellow);
                }
                else if (weekNumber == 4)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton4");
                    test.BackgroundColor = Color.FromHex(yellow);
                }
                else if (weekNumber == 5)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton5");
                    test.BackgroundColor = Color.FromHex(yellow);
                }
                else if (weekNumber == 6)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton6");
                    test.BackgroundColor = Color.FromHex(yellow);
                }
                BackToSchedule(sender, e);
            }
        }

        void OnInfoClicked(Object sender, EventArgs args)
        {
            Button infoB = sender as Button;
            var model = infoB.BindingContext as Meal;
            DisplayAlert("Ingredients", model.description.ToString(), "OK");
        }

        private async void BackToSchedule(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }

        public Color refreshPageSelections()
        {
            return colorToReturn;
        }
    }
}
