using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
namespace InfiniteMeals.Model.Meals
{
    public class MealScheduleSaves
    {
        public partial class MealScheduleSavedColors
        {
            public string planName { get; set; }
            public Dictionary<string, string> controlColor { get; set; }
        }
    }
}
