using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace InfiniteMeals.Steppers
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class BasicSteppers : ContentPage
    {
        public BasicSteppers()
        {
            InitializeComponent();
        }

        void OnStepperValueChanged(object sender, ValueChangedEventArgs e)
        {
            double value = e.NewValue;
            _stepperLabels.Value = value;
            _displayLabels.Text = string.Format("{0}", value);
        }

    }
}