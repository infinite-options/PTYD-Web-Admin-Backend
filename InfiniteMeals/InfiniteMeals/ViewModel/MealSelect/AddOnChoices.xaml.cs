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
        public static Label quantity;
        public ToolbarItem totalBar = new ToolbarItem();
        public Dictionary<string, int> mealQtyDict = new Dictionary<string, int>();
        private static ObservableCollection<MealGroup> grouped { get; set; }
        private static ObservableCollection<MealGroup> grouped2 { get; set; }
        private static ObservableCollection<MealGroup> grouped3 { get; set; }
        private static ObservableCollection<MealGroup> grouped4 { get; set; }
        private static ObservableCollection<MealGroup> grouped5 { get; set; }
        private static ObservableCollection<MealGroup> grouped6 { get; set; }

        // Week 1
        public static MealGroup addAddOnGroup = new MealGroup() { LongName = "Add Ons" };
        public static MealGroup addMealGroup = new MealGroup() { LongName = "Additional Meals" };
        public static MealGroup addSmoothieGroup = new MealGroup() { LongName = "Additional Smoothies" };
        // Week 2
        public static MealGroup addAddOnGroup2 = new MealGroup() { LongName = "Add Ons" };
        public static MealGroup addMealGroup2 = new MealGroup() { LongName = "Additional Meals" };
        public static MealGroup addSmoothieGroup2 = new MealGroup() { LongName = "Additional Smoothies" };
        // Week 3
        public static MealGroup addAddOnGroup3 = new MealGroup() { LongName = "Add Ons" };
        public static MealGroup addMealGroup3 = new MealGroup() { LongName = "Additional Meals" };
        public static MealGroup addSmoothieGroup3 = new MealGroup() { LongName = "Additional Smoothies" };
        // Week 4
        public static MealGroup addAddOnGroup4 = new MealGroup() { LongName = "Add Ons" };
        public static MealGroup addMealGroup4 = new MealGroup() { LongName = "Additional Meals" };
        public static MealGroup addSmoothieGroup4 = new MealGroup() { LongName = "Additional Smoothies" };
        // Week 5
        public static MealGroup addAddOnGroup5 = new MealGroup() { LongName = "Add Ons" };
        public static MealGroup addMealGroup5 = new MealGroup() { LongName = "Additional Meals" };
        public static MealGroup addSmoothieGroup5 = new MealGroup() { LongName = "Additional Smoothies" };
        // Week 6
        public static MealGroup addAddOnGroup6 = new MealGroup() { LongName = "Add Ons" };
        public static MealGroup addMealGroup6 = new MealGroup() { LongName = "Additional Meals" };
        public static MealGroup addSmoothieGroup6 = new MealGroup() { LongName = "Additional Smoothies" };

        String infoImg = "info.jpeg";
        public double subTotal;
        public static string postUrl;
        public static string pid;
        public static int weekNumber;
        public static List<DateTimeOffset> weekAffectedList;
        public static string[] deliveryDayList;
        public static string yellow = "#ce790d";
        public static string def = "#F5F5F5";
        public Color colorToReturn = Color.FromHex("#F5F5F5");
        public MealSchedule currentMealSchedule;

        public AddOnChoices()
        {
            InitializeComponent();
            getData();

        }

        public AddOnChoices(MealSchedule mealSchedule)
        {
            InitializeComponent();
            this.currentMealSchedule = mealSchedule;
            getData();
        }

        public void getData()
        {
            //MealSchedule ms = new MealSchedule();
            MealSchedule ms = this.currentMealSchedule;
            weekNumber = ms.getNum();
            System.Diagnostics.Debug.WriteLine("HERE IS THE WEEK NUM" + weekNumber);



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
            grouped2 = new ObservableCollection<MealGroup>();
            grouped3 = new ObservableCollection<MealGroup>();
            grouped4 = new ObservableCollection<MealGroup>();
            grouped5 = new ObservableCollection<MealGroup>();
            grouped6 = new ObservableCollection<MealGroup>();


            WebClient client = new WebClient();
            var content = client.DownloadString("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);

            if (weekNumber == 1)
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

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    };

                    if (addAddOnGroup.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        addAddOnGroup.Remove(addAddOnGroup.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        addAddOnGroup.Add(holder);

                    }
                    else
                    {
                        addAddOnGroup.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    };

                    if (addMealGroup.Any(x => x.id == jsonObjectSeasonal.Menu[j].MealId))
                    {
                        addMealGroup.Remove(addMealGroup.Where(x => x.id == jsonObjectSeasonal.Menu[j].MealId).Single());
                        addMealGroup.Add(holder);

                    }
                    else
                    {
                        addMealGroup.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    };

                    if (addSmoothieGroup.Any(x => x.id == jsonObjectSmoothie.Menu[k].MealId))
                    {
                        addSmoothieGroup.Remove(addSmoothieGroup.Where(x => x.id == jsonObjectSmoothie.Menu[k].MealId).Single());
                        addSmoothieGroup.Add(holder);

                    }
                    else
                    {
                        addSmoothieGroup.Add(holder);
                    }
                }

                grouped.Add(addAddOnGroup);
                grouped.Add(addMealGroup);
                grouped.Add(addSmoothieGroup);
            }
            else if (weekNumber == 2)
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

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    };

                    if (addAddOnGroup2.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        addAddOnGroup2.Remove(addAddOnGroup2.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        addAddOnGroup2.Add(holder);

                    }
                    else
                    {
                        addAddOnGroup2.Add(holder);
                    }
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
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    };

                    if (addMealGroup2.Any(x => x.id == jsonObjectSeasonal.Menu[j].MealId))
                    {
                        addMealGroup2.Remove(addMealGroup2.Where(x => x.id == jsonObjectSeasonal.Menu[j].MealId).Single());
                        addMealGroup2.Add(holder);

                    }
                    else
                    {
                        addMealGroup2.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    };

                    if (addSmoothieGroup2.Any(x => x.id == jsonObjectSmoothie.Menu[k].MealId))
                    {
                        addSmoothieGroup2.Remove(addSmoothieGroup2.Where(x => x.id == jsonObjectSmoothie.Menu[k].MealId).Single());
                        addSmoothieGroup2.Add(holder);

                    }
                    else
                    {
                        addSmoothieGroup2.Add(holder);
                    }

                }

                grouped2.Add(addAddOnGroup2);
                grouped2.Add(addMealGroup2);
                grouped2.Add(addSmoothieGroup2);
            }
            else if (weekNumber == 3)
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

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    };

                    if (addAddOnGroup3.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        addAddOnGroup3.Remove(addAddOnGroup3.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        addAddOnGroup3.Add(holder);

                    }
                    else
                    {
                        addAddOnGroup3.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    };

                    if (addMealGroup3.Any(x => x.id == jsonObjectSeasonal.Menu[j].MealId))
                    {
                        addMealGroup3.Remove(addMealGroup3.Where(x => x.id == jsonObjectSeasonal.Menu[j].MealId).Single());
                        addMealGroup3.Add(holder);

                    }
                    else
                    {
                        addMealGroup3.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    };

                    if (addSmoothieGroup3.Any(x => x.id == jsonObjectSmoothie.Menu[k].MealId))
                    {
                        addSmoothieGroup3.Remove(addSmoothieGroup3.Where(x => x.id == jsonObjectSmoothie.Menu[k].MealId).Single());
                        addSmoothieGroup3.Add(holder);

                    }
                    else
                    {
                        addSmoothieGroup3.Add(holder);
                    }

                }

                grouped3.Add(addAddOnGroup3);
                grouped3.Add(addMealGroup3);
                grouped3.Add(addSmoothieGroup3);
            }
            else if (weekNumber == 4)
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

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    };

                    if (addAddOnGroup4.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        addAddOnGroup4.Remove(addAddOnGroup4.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        addAddOnGroup4.Add(holder);

                    }
                    else
                    {
                        addAddOnGroup4.Add(holder);
                    }
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
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    };

                    if (addMealGroup4.Any(x => x.id == jsonObjectSeasonal.Menu[j].MealId))
                    {
                        addMealGroup4.Remove(addMealGroup4.Where(x => x.id == jsonObjectSeasonal.Menu[j].MealId).Single());
                        addMealGroup4.Add(holder);

                    }
                    else
                    {
                        addMealGroup4.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    };

                    if (addSmoothieGroup4.Any(x => x.id == jsonObjectSmoothie.Menu[k].MealId))
                    {
                        addSmoothieGroup4.Remove(addSmoothieGroup4.Where(x => x.id == jsonObjectSmoothie.Menu[k].MealId).Single());
                        addSmoothieGroup4.Add(holder);

                    }
                    else
                    {
                        addSmoothieGroup4.Add(holder);
                    }

                }

                grouped4.Add(addAddOnGroup4);
                grouped4.Add(addMealGroup4);
                grouped4.Add(addSmoothieGroup4);
            }
            else if (weekNumber == 5)
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

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    };

                    if (addAddOnGroup5.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        addAddOnGroup5.Remove(addAddOnGroup5.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        addAddOnGroup5.Add(holder);

                    }
                    else
                    {
                        addAddOnGroup5.Add(holder);
                    }
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
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    };

                    if (addMealGroup5.Any(x => x.id == jsonObjectSeasonal.Menu[j].MealId))
                    {
                        addMealGroup5.Remove(addMealGroup5.Where(x => x.id == jsonObjectSeasonal.Menu[j].MealId).Single());
                        addMealGroup5.Add(holder);

                    }
                    else
                    {
                        addMealGroup5.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    };

                    if (addSmoothieGroup5.Any(x => x.id == jsonObjectSmoothie.Menu[k].MealId))
                    {
                        addSmoothieGroup5.Remove(addSmoothieGroup5.Where(x => x.id == jsonObjectSmoothie.Menu[k].MealId).Single());
                        addSmoothieGroup5.Add(holder);

                    }
                    else
                    {
                        addSmoothieGroup5.Add(holder);
                    }

                }

                grouped5.Add(addAddOnGroup5);
                grouped5.Add(addMealGroup5);
                grouped5.Add(addSmoothieGroup5);
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

                    Meal holder = new Meal
                    {
                        id = jsonObject.Menu[placeHolder].MealId,
                        name = AddNames[placeHolder],
                        price = AddPrice[placeHolder],
                        description = AddDesc[placeHolder],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddQty[placeHolder],
                        total = 0.00,
                    };

                    if (addAddOnGroup6.Any(x => x.id == jsonObject.Menu[placeHolder].MealId))
                    {
                        addAddOnGroup6.Remove(addAddOnGroup6.Where(x => x.id == jsonObject.Menu[placeHolder].MealId).Single());
                        addAddOnGroup6.Add(holder);

                    }
                    else
                    {
                        addAddOnGroup6.Add(holder);
                    }
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
                    Meal holder = new Meal
                    {
                        id = jsonObjectSeasonal.Menu[j].MealId,
                        name = AddMealName[j],
                        price = AddMealPrice[j],
                        description = AddMealDesc[j],
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddMealQty[j],
                        total = 0.00,
                    };

                    if (addMealGroup6.Any(x => x.id == jsonObjectSeasonal.Menu[j].MealId))
                    {
                        addMealGroup6.Remove(addMealGroup6.Where(x => x.id == jsonObjectSeasonal.Menu[j].MealId).Single());
                        addMealGroup6.Add(holder);

                    }
                    else
                    {
                        addMealGroup6.Add(holder);
                    }
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

                    Meal holder = new Meal
                    {
                        id = jsonObjectSmoothie.Menu[k].MealId,
                        name = jsonObjectSmoothie.Menu[k].MealName,
                        price = Convert.ToDouble(jsonObjectSmoothie.Menu[k].ExtraMealPrice),
                        description = jsonObjectSmoothie.Menu[k].MealDesc,
                        imageUrl = imageMeal,
                        infoUrl = infoImg,
                        qty = AddSmoothieQty[k],
                        total = 0.00,
                    };

                    if (addSmoothieGroup6.Any(x => x.id == jsonObjectSmoothie.Menu[k].MealId))
                    {
                        addSmoothieGroup6.Remove(addSmoothieGroup6.Where(x => x.id == jsonObjectSmoothie.Menu[k].MealId).Single());
                        addSmoothieGroup6.Add(holder);

                    }
                    else
                    {
                        addSmoothieGroup6.Add(holder);
                    }

                }

                grouped6.Add(addAddOnGroup6);
                grouped6.Add(addMealGroup6);
                grouped6.Add(addSmoothieGroup6);
            }

            totalBar.Order = ToolbarItemOrder.Primary;
            totalBar.Priority = 0;

            if (subTotal == 0)
            {
                totalBar.Text = "Close";
            }
            else
            {
                totalBar.Text = string.Format("Agree to Pay: ${0:#,0.00}", subTotal);
            }

            totalBar.Clicked += postData;
            this.ToolbarItems.Add(totalBar);

            if (weekNumber == 1)
            {
                lstView.ItemsSource = grouped;
            }
            else if (weekNumber == 2)
            {
                lstView.ItemsSource = grouped2;
            }
            else if (weekNumber == 3)
            {
                lstView.ItemsSource = grouped3;
            }
            else if (weekNumber == 4)
            {
                lstView.ItemsSource = grouped4;
            }
            else if (weekNumber == 5)
            {
                lstView.ItemsSource = grouped5;
            }
            else
            {
                lstView.ItemsSource = grouped6;
            }
            lstView.SelectionMode = ListViewSelectionMode.None;
            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");

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

                /*
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
            steppers.Margin = new Thickness(40, 0, 0, 0);

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

                */


                // Decrement Button
                var decrementMealQuantityButton = new Button
                {
                    Text = "-"
                };

                decrementMealQuantityButton.Clicked += (sender, e) => {
                    Button btn = sender as Button;
                    Meal meal = btn.BindingContext as Meal;
                    if (meal.qty == 0)
                    {
                        return;
                    }
                    meal.qty -= 1;
                    if (meal.qty == 0)
                    {

                        if (mealQtyDict.ContainsKey(meal.id))
                        {
                            mealQtyDict.Remove(meal.id);
                            System.Diagnostics.Debug.WriteLine(meal.id + " was removed");
                        }
                    }
                    else
                    {
                        mealQtyDict[meal.id] = meal.qty;
                    }

                    subTotal -= meal.price;
                    meal.total = subTotal;
                    if (subTotal < 0)
                    {
                        subTotal = 0.00;
                        meal.total = subTotal;
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


                // Increment Button
                var incrementMealQuantityButton = new Button
                {
                    Text = "+"
                };


                incrementMealQuantityButton.Clicked += (sender, e) => {
                    Button btn = sender as Button;
                    Meal meal = btn.BindingContext as Meal;

                    meal.qty += 1;
                    //model.qty = (int)steppers.Value;
                    subTotal += meal.price;
                    meal.total = subTotal;

                    if (!mealQtyDict.ContainsKey(meal.id))
                    {
                        mealQtyDict.Add(meal.id, meal.qty);
                    }
                    else
                    {
                        mealQtyDict[meal.id] = meal.qty;
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


                // Quantity Label 
                quantity = new Label
                {
                    FontSize = 15,
                    FontAttributes = FontAttributes.Bold,
                    HorizontalOptions = LayoutOptions.Center,
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
                //grid.Children.Add(steppers, 3, 1);
                //steppers.SetValue(Grid.ColumnSpanProperty, 3);
                grid.Children.Add(decrementMealQuantityButton, 4, 1);
                grid.Children.Add(incrementMealQuantityButton, 5, 1);
                grid.Children.Add(quantity, 5, 0);

                return new ViewCell { View = grid, Height = 100 };
            });

            Content = lstView;
            BindingContext = this;

        }

        public async void postData(object sender, EventArgs e)
        {
            HttpClient client = new HttpClient();
            MealSchedule ms = this.currentMealSchedule;
            int weekNumber = ms.getNum();
            string postUrl = ms.getPlanPicked();
            string pid = ms.getPlanNumPicked();

            // Getter Information
            List<DateTimeOffset> weekAffectedList = ms.getWeekList();    // Week Affected Dates
            string[] deliveryDayList = ms.getDDArray();                  // Delivery Days ( 6 of them )
            Dictionary<string, int> emptyDict = new Dictionary<string, int>();
            emptyDict.Add("", 0);

            // If no changes
            System.Diagnostics.Debug.WriteLine("TotalBar text: " + totalBar.Text + " " + mealQtyDict.Count + " " + weekNumber + " " + postUrl + " " + pid);

            if (mealQtyDict.Count == 0 && !totalBar.Text.Equals("Close"))
            {
                System.Diagnostics.Debug.WriteLine("Pop Async");
                //BackToSchedule(sender, e);
                await Navigation.PopAsync();
            }
            // If no add ons
            else if (mealQtyDict.Count == 0)
            {
                System.Diagnostics.Debug.WriteLine("TotalBar text quantity 0");

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
                    if (weekNumber == 1)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton");
                        test.BackgroundColor = Color.FromHex(def);
                        test.TextColor = Color.Black;
                    }
                    else if (weekNumber == 2)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton2");
                        test.BackgroundColor = Color.FromHex(def);
                        test.TextColor = Color.Black;

                    }
                    else if (weekNumber == 3)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton3");
                        test.BackgroundColor = Color.FromHex(def);
                        test.TextColor = Color.Black;

                    }
                    else if (weekNumber == 4)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton4");
                        test.BackgroundColor = Color.FromHex(def);
                        test.TextColor = Color.Black;

                    }
                    else if (weekNumber == 5)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton5");
                        test.BackgroundColor = Color.FromHex(def);
                        test.TextColor = Color.Black;

                    }
                    else if (weekNumber == 6)
                    {
                        MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                        Button test = (Button)mealSchedulePage.FindByName("AddonButton6");
                        test.BackgroundColor = Color.FromHex(def);
                        test.TextColor = Color.Black;

                    }

                }
                await Navigation.PopAsync();

                //BackToSchedule(sender, e);

            }
            // If the add ons are not empty
            else
            {
                System.Diagnostics.Debug.WriteLine("TotalBar text: multiple quantity");

                foreach (var item in mealQtyDict)
                {
                    System.Diagnostics.Debug.WriteLine("Dictionary: " + item.Key + item.Value);

                }


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
                    test.TextColor = Color.White;
                }
                else if (weekNumber == 2)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton2");
                    test.BackgroundColor = Color.FromHex(yellow);
                    test.TextColor = Color.White;

                }
                else if (weekNumber == 3)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton3");
                    test.BackgroundColor = Color.FromHex(yellow);
                    test.TextColor = Color.White;

                }
                else if (weekNumber == 4)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton4");
                    test.BackgroundColor = Color.FromHex(yellow);
                    test.TextColor = Color.White;

                }
                else if (weekNumber == 5)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton5");
                    test.BackgroundColor = Color.FromHex(yellow);
                    test.TextColor = Color.White;

                }
                else if (weekNumber == 6)
                {
                    MealSchedule mealSchedulePage = (MealSchedule)this.BindingContext;
                    Button test = (Button)mealSchedulePage.FindByName("AddonButton6");
                    test.BackgroundColor = Color.FromHex(yellow);
                    test.TextColor = Color.White;

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
