using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.Subscribe
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class TenMeals : ContentPage
    {
        public TenMeals()
        {
            InitializeComponent();

            mealimage.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage1.Source = ImageSource.FromFile("mealplan.jpg");
            mealimage2.Source = ImageSource.FromFile("mealplan.jpg");
        }
    }
}