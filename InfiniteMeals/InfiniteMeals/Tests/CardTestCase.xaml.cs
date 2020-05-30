using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using InfiniteMeals.Utilities.Converters;

namespace InfiniteMeals.Tests {
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class CardTestCase : ContentPage {
        public CardTestCase() {

            InitializeComponent();


            System.Diagnostics.Debug.WriteLine("Test Case Start!");
            System.Diagnostics.Debug.WriteLine("Visa: " + CardParser.validateCard(4929650861605758));
            System.Diagnostics.Debug.WriteLine("Visa: " + CardParser.validateCard(4485943428975756));
            System.Diagnostics.Debug.WriteLine("Amex: " + CardParser.validateCard(342269787907623));
            System.Diagnostics.Debug.WriteLine("Amex: " + CardParser.validateCard(371141329871449));
            System.Diagnostics.Debug.WriteLine("Diners: " + CardParser.validateCard(36817133562731));
            System.Diagnostics.Debug.WriteLine("Diners: " + CardParser.validateCard(30284958217394));
            System.Diagnostics.Debug.WriteLine("MasterCard: " + CardParser.validateCard(5272714214304400));
            System.Diagnostics.Debug.WriteLine("MasterCard: " + CardParser.validateCard(5304238005599053));
            System.Diagnostics.Debug.WriteLine("Discover: " + CardParser.validateCard(6011411130389136));
            System.Diagnostics.Debug.WriteLine("Discover: " + CardParser.validateCard(6011093033795278));
            System.Diagnostics.Debug.WriteLine("JCB: " + CardParser.validateCard(3530111333300000));
            System.Diagnostics.Debug.WriteLine("JCB: " + CardParser.validateCard(3528373068549300));

        }
    }
}