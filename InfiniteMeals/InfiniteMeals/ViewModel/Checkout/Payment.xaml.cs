using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Model.Checkout;

namespace InfiniteMeals.ViewModel.Checkout {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Payment : ContentPage {
        public Payment() {
            InitializeComponent();

            
        }
    }
}