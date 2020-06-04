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
    public partial class AddOnChoices : ContentPage
    {
        private ObservableCollection<MealGroup> grouped { get; set; }
        public IList<Meal> AddOn { get; private set; }
        public IList<Meal> MoreMeals { get; private set; }
        public Label quantity;
        String infoImg = "info.jpg";
        public AddOnChoices()
        {
            InitializeComponent();
            getData();
        }

        public async void getData()
        {
            AddOn = new List<Meal>();
            MoreMeals = new List<Meal>();

            // Normal Meals
            List<String> AddNames = new List<String>();
            List<String> AddDesc = new List<String>();
            List<String> AddPrice = new List<String>();
            List<String> AddImage = new List<String>();

            List<String> AddMealName = new List<String>();
            List<String> AddMealDesc = new List<String>();
            List<String> AddMealPrice = new List<String>();
            List<String> AddMealImage = new List<String>();

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
                AddNames.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealName);
                AddDesc.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealDesc);
                AddPrice.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].ExtraMealPrice);
                AddImage.Add(obj.Result.MenuForWeek1.Addons.AddonsAddons.Menu[placeHolder].MealPhotoUrl.ToString());

                addAddOnGroup.Add(new Meal
                {
                    name = AddNames[placeHolder],
                    price = "Add On Cost: $" + AddPrice[placeHolder],
                    description = AddDesc[placeHolder],
                    imageUrl = AddImage[placeHolder],
                    infoUrl = infoImg,
                }) ;
            }

            for (int j = 0; j < obj.Result.MenuForWeek1.Addons.Weekly.Menu.Length; j++)
            {
                AddMealName.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealName);
                AddMealDesc.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].MealDesc);
                AddMealPrice.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[j].ExtraMealPrice);
                //AddMealImage.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[placeHolder].MealPhotoUrl.ToString());

                addMealGroup.Add(new Meal
                {
                    name = AddMealName[j],
                    price = "Add On Cost: $" + AddMealPrice[j],
                    description = AddMealDesc[j],
                    //imageUrl = AddImage[placeHolder],
                    infoUrl = infoImg,
                });
            }

            for (int k = 0; k < obj.Result.MenuForWeek1.Addons.Smoothies.Menu.Length; k++)
            {
                AddMealName.Add(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealName);
                System.Diagnostics.Debug.WriteLine("hello " + obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealName);
                AddMealDesc.Add(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealDesc);
                AddMealPrice.Add(obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].ExtraMealPrice);
                //AddMealImage.Add(obj.Result.MenuForWeek1.Addons.Weekly.Menu[placeHolder].MealPhotoUrl.ToString());

                addSmoothieGroup.Add(new Meal
                {
                    name = obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealName,
                    price = "Add On Cost: $" + obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].ExtraMealPrice,
                    description = obj.Result.MenuForWeek1.Addons.Smoothies.Menu[k].MealDesc,
                    //imageUrl = AddImage[placeHolder],
                    infoUrl = infoImg,
                });
            }

            grouped.Add(addAddOnGroup);
            grouped.Add(addMealGroup);
            grouped.Add(addSmoothieGroup);
            lstView.ItemsSource = grouped;
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
                    VerticalOptions = LayoutOptions.Center,
                };
                infoButton.Margin = new Thickness(50, 0, 0, 0);
                var steppers = new Stepper
                {
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
                    costLabel.Text = string.Format("Add On Cost: ${0}", steppers.Value * 11.99);
                };

                quantity = new Label
                {
                    FontAttributes = FontAttributes.Bold,
                    HorizontalTextAlignment = TextAlignment.Start,
                    VerticalTextAlignment = TextAlignment.Center,
                };
                quantity.Margin = new Thickness(0, 0, 100, 0);

                nameLabel.SetBinding(Label.TextProperty, "name");
                costLabel.SetBinding(Label.TextProperty, "price");
                imgLabel.SetBinding(Image.SourceProperty, "imageUrl");
                infoButton.SetBinding(Image.SourceProperty, "infoUrl");

                grid.Children.Add(imgLabel, 0, 0);
                imgLabel.SetValue(Grid.RowSpanProperty, 2);
                grid.Children.Add(nameLabel, 1, 0);
                grid.Children.Add(costLabel, 1, 1);
                grid.Children.Add(infoButton, 2, 0);
                grid.Children.Add(steppers, 2, 1);
                steppers.SetValue(Grid.ColumnSpanProperty, 2);
                grid.Children.Add(displayLabel, 3, 0);

                return new ViewCell { View = grid, Height = 100 };
            });

            Content = lstView;
            BindingContext = this;
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

        void OnInfoClicked(object sender, EventArgs e)
        {
        }
    }
}
