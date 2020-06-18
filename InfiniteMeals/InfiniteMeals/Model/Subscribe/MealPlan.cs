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
                    return "Five Meal Plan";
                case MealPlan.TenMeals:
                    return "Ten Meal Plan";
                case MealPlan.FifteenMeals:
                    return "Fifteen Meal Plan";
                case MealPlan.TwentyMeals:
                    return "Twenty Meal Plan";
                default:
                    return "No meal plan";
            }
        }
    }
}
