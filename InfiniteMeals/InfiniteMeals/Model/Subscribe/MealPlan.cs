using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace InfiniteMeals.Model.Subscribe {
    public enum MealPlan {
        FiveMeals,
        TenMeals,
        FifteenMeals,
        TwentyMeals,
        Unknown
    }

    static class MealPlanExtension {
        public static string mealPlanToString(MealPlan mealPlan) {
            switch(mealPlan) {
                case MealPlan.FiveMeals:
                    return "5 Meal Plan";
                case MealPlan.TenMeals:
                    return "10 Meal Plan";
                case MealPlan.FifteenMeals:
                    return "15 Meal Plan";
                case MealPlan.TwentyMeals:
                    return "20 Meal Plan";
                default:
                    return "No meal plan";
            }
        }
    }
}
