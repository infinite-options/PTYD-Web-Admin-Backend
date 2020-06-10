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

namespace InfiniteMeals.MealSelect
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AddOnChoices : ContentPage
    {
        private ObservableCollection<MealGroup> grouped { get; set; }

        String infoImg = "info.jpg";
        Label subtotalLabel;
        double subTotal = 0.00;
        public AddOnChoices()
        {
            InitializeComponent();
            getData();
        }

        public async void getData()
        {

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

            HttpClient client = new HttpClient();
            var content = await client.GetStringAsync("https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/meals");
            var obj = JsonConvert.DeserializeObject<Data>(content);


            for (int placeHolder = 0; placeHolder < obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu.Length; placeHolder++)
            {
                String imageMeal;
                AddNames.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealName);
                AddDesc.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealDesc);
                AddPrice.Add(Convert.ToDouble(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].ExtraMealPrice));
                AddQty.Add(0);
                if (obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                    AddImage.Add(imageMeal);
                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealPhotoUrl.ToString();
                    AddImage.Add(imageMeal);

                }

                addAddOnGroup.Add(new Meal
                {
                    name = AddNames[placeHolder],
                    price = AddPrice[placeHolder],
                    description = AddDesc[placeHolder],
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = AddQty[placeHolder],
                    total = 0.00,
                });
            }

            for (int j = 0; j < obj.Result.MenuForWeek1.Addons.Weekly.Menu.Length; j++)
            {
                String imageMeal;
                AddMealName.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealName);
                AddMealDesc.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealDesc);
                AddMealPrice.Add(Convert.ToDouble(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].ExtraMealPrice));
                AddMealQty.Add(0);
                if (obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                    AddMealImage.Add(imageMeal);

                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealPhotoUrl.ToString();
                    AddMealImage.Add(imageMeal);

                }
                addMealGroup.Add(new Meal
                {
                    name = AddMealName[j],
                    price = AddMealPrice[j],
                    description = AddMealDesc[j],
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = AddMealQty[j],
                    total = 0.00,
                });
            }

            for (int k = 0; k < obj.Result.MenuForWeek1.Addons.Smoothies.Menu.Length; k++)
            {
                String imageMeal;
                AddSmoothiesName.Add(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealName);
                AddSmoothiesDesc.Add(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealDesc);
                AddSmoothiesPrice.Add(Convert.ToDouble(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].ExtraMealPrice));
                AddSmoothieQty.Add(0);
                if (obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealPhotoUrl == null)
                {
                    imageMeal = "defaultmeal.png";
                    AddSmoothiesImage.Add(imageMeal);

                }
                else
                {
                    imageMeal = obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealPhotoUrl.ToString();
                    AddSmoothiesImage.Add(imageMeal);
                }
                addSmoothieGroup.Add(new Meal
                {
                    name = obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealName,
                    price = Convert.ToDouble(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].ExtraMealPrice),
                    description = obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealDesc,
                    imageUrl = imageMeal,
                    infoUrl = infoImg,
                    qty = AddSmoothieQty[k],
                    total = 0.00,
                });

            }

            grouped.Add(addAddOnGroup);
            grouped.Add(addMealGroup);
            grouped.Add(addSmoothieGroup);


            lstView.ItemsSource = grouped;
            lstView.IsGroupingEnabled = true;
            lstView.GroupDisplayBinding = new Binding("LongName");
            lstView.GroupShortNameBinding = new Binding("ShortName");
            subtotalLabel = new Label
            {
                TextColor = Color.White,
                Text = "Agree to Pay: $0.00",
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.CenterAndExpand
            };

            StackLayout sl = new StackLayout
            {
                BackgroundColor = Color.Black,
                HeightRequest = 50,
            };
            sl.Children.Add(subtotalLabel);
            lstView.Footer = sl;

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
                var costLabel= new Label
                {
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center
                };
                var imgLabel = new Image
                {
                    WidthRequest = 200,
                    HeightRequest = 100,
                    Aspect = Aspect.AspectFill,
                    HorizontalOptions = LayoutOptions.CenterAndExpand,
                    VerticalOptions = LayoutOptions.CenterAndExpand
                };
                var infoButton = new ImageButton
                {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    Aspect = Aspect.AspectFit,
                    HorizontalOptions = LayoutOptions.Start,
                    VerticalOptions = LayoutOptions.Center
                };
                infoButton.Margin = new Thickness(50, 0, 0, 0);
                infoButton.Clicked += (sender, e) =>
                {
                    ImageButton stepper = sender as ImageButton;
                    var model = stepper.BindingContext as Meal;
                    //Button infoB = sender as Button;
                   // var model = infoB.BindingContext as Meal;
                    DisplayAlert("Ingredients", model.description.ToString(), "OK");
                };

                var steppers = new Stepper
                {
                    Value = 0,
                    Maximum = 10,
                    Increment = 1,
                    HeightRequest = 50
                };

                steppers.ValueChanged += (sender, e) =>
                {
                    Stepper stepper = sender as Stepper;
                    var model = stepper.BindingContext as Meal;
                    var stepperVal = stepper.Value;


                    if (stepperVal > model.qty)
                    {
                        model.qty = (int)steppers.Value;
                        //model.total = model.qty * model.price;
                        subTotal += model.price;
                    }
                    else if (stepperVal < model.qty)
                    {

                        model.qty = (int)steppers.Value;
                        subTotal -= model.price;
                        if (subTotal < 0)
                        {
                            subTotal = 0.00;
                        }
                    }

                    subtotalLabel.Text = string.Format("Agree to Pay: ${0}", subTotal);
                    System.Diagnostics.Debug.WriteLine(model.price + " " + model.name + " " + model.qty + " " + model.total + " " + subTotal);
                };

                Label quantity = new Label
                {
                    WidthRequest = 20,
                    HeightRequest = 20,
                    HorizontalOptions = LayoutOptions.Start,
                    VerticalOptions = LayoutOptions.Center
                };

                nameLabel.SetBinding(Label.TextProperty, "name");
                costLabel.SetBinding(Label.TextProperty, "price");
                quantity.SetBinding(Label.TextProperty, "qty");
                costLabel.SetBinding(Label.TextProperty, "price");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                infoButton.SetBinding(Image.SourceProperty, "infoUrl");

                grid.Children.Add(imgLabel, 0, 0);
                imgLabel.SetValue(Grid.RowSpanProperty, 2);
                grid.Children.Add(nameLabel, 1, 0);
                grid.Children.Add(quantity, 3, 0);
                grid.Children.Add(costLabel, 1, 1);
                grid.Children.Add(infoButton, 2, 0);
                grid.Children.Add(steppers, 2, 1);
                steppers.SetValue(Grid.ColumnSpanProperty, 2);

                return new ViewCell { View = grid, Height = 100 };
            });
            Content = lstView;
            BindingContext = this;
        }

        public Command onInfoCommand
        {
            get
            {
                return new Command((e) =>
                {
                    Meal item = e as Meal;
                    System.Diagnostics.Debug.WriteLine(item.description.ToString() + " hello");
                });
            }
        }

        void OnInfoClicked(Object sender, EventArgs args)
        {
            Button infoB = sender as Button;
            var model = infoB.BindingContext as Meal;
            DisplayAlert("Ingredients", model.description.ToString(), "OK");
        }

        void OnListViewItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            Meal selectedItem = e.SelectedItem as Meal;
            DisplayAlert("Ingredients", selectedItem.description.ToString(), "OK");
        }

        void OnListViewItemTapped(object sender, ItemTappedEventArgs e)
        {
            Meal tappedItem = e.Item as Meal;
            DisplayAlert("Ingredients", tappedItem.description.ToString(), "OK");
        }
    }
}
