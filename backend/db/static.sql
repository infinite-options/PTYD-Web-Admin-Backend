DROP TABLE IF EXISTS MealPlans;
CREATE TABLE IF NOT EXISTS MealPlans ( 
    MealsPerWeek INT NOT NULL,
    PlanSummary VARCHAR(255),
    PlanFooter VARCHAR(64)
);  
    
DROP TABLE IF EXISTS PaymentPlans;
CREATE TABLE IF NOT EXISTS PaymentPlans (
    MealsPerWeek INT NOT NULL,
    WeekToWeek BOOL NOT NULL,
    WeekToWeekPrice DECIMAL(7,2),
    TwoWeekPrePay BOOL NOT NULL,
    TwoWeekPrice DECIMAL(7,2),
    FourWeekPrePay BOOL NOT NULL,
    FourWeekPrice DECIMAL(7,2)
);

DROP TABLE IF EXISTS PaymentAdjustments;
CREATE TABLE IF NOT EXISTS PaymentAdjustments (
    PromoCode VARCHAR(64) NOT NULL,
    Reduction INT NOT NULL,
    Unit VARCHAR(32) NOT NULL,
    AppliesTo VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS UnitConversion;
CREATE TABLE IF NOT EXISTS UnitConversion (
    BuyUnit VARCHAR(64) NOT NULL,
    IngredientUnit VARCHAR(64) NOT NULL
);
