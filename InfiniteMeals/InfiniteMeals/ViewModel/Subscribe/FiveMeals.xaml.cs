using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.ViewModel.Checkout;

namespace InfiniteMeals.Subscribe
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class FiveMeals : ContentPage
    {
        public FiveMeals()
        {
            InitializeComponent();

            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage2.Source = ImageSource.FromFile("mealplan.jpg");
        }

        private async void ClickedWeekToWeek(object sender, EventArgs e) {
            await Navigation.PushAsync(new Delivery());
        }
    }
}