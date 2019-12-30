USE pricing;

DROP TABLE IF EXISTS Ingredients;

DROP TABLE IF EXISTS Meals;
CREATE TABLE IF NOT EXISTS Meals (
    Meals VARCHAR(20) NOT NULL,
    Actual_Meal VARCHAR(50) NOT NULL,
    Calories INT NOT NULL,
    Protein DECIMAL(6,2) NOT NULL,
    Carbs DECIMAL(6,2) NOT NULL,
    Sugar DECIMAL(6,2) NOT NULL,
    Fiber DECIMAL(6,2) NOT NULL,
    Fat DECIMAL(6,2) NOT NULL,
    Sat DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (Actual_Meal)
);

DROP TABLE IF EXISTS Subscriptions;
CREATE TABLE IF NOT EXISTS Subscriptions (
    customer_id VARCHAR(10) NOT NULL,
    customer_name VARCHAR(64) NOT NULL,
    customer_email VARCHAR(64) NOT NULL,
    ship_to VARCHAR(64) NOT NULL,
    customer_first VARCHAR(32) NOT NULL,
    customer_last VARCHAR(32) NOT NULL,
    ship_street VARCHAR(32) NOT NULL,
    ship_unit VARCHAR(16),
    ship_city VARCHAR(16) NOT NULL,
    ship_phone_number VARCHAR(14) NOT NULL,
    ship_state VARCHAR(2) NOT NULL,
    ship_zip_code INT NOT NULL,
    ship_country VARCHAR(2) NOT NULL,
    product_0_name VARCHAR(18) NOT NULL,
    product_0_sku VARCHAR(14) NOT NULL
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
    Date_Submitted DATETIME NOT NULL,
    Last_Name VARCHAR(32),
    First_Name VARCHAR(32),
    Email VARCHAR(64),
    Delivery_Time VARCHAR(176),
    Phone_Number VARCHAR(14),
    Meal_Plan VARCHAR(8),
    WKLY_SPCL_1 INT,
    WKLY_SPCL_2 INT,
    WKLY_SPCL_3 INT,
    SEAS_FAVE_1 INT,
    SEAS_FAVE_2 INT,
    SEAS_FAVE_3 INT,
    THE_ORIGINAL INT,
    ALMOND_BUTTER INT,
    THE_ENERGIZER INT,
    SEASONAL_SMOOTHIE INT,
--  D12222019 VARCHAR(30),
--  D12292019 VARCHAR(30),
--  D152020 VARCHAR(30),
--  D1122020 VARCHAR(30),
--  D1192020 VARCHAR(30),
--  D1262020 VARCHAR(30),
    Pick_Meals VARCHAR(41)
);

DROP TABLE IF EXISTS MealPlans;
CREATE TABLE IF NOT EXISTS MealPlans (
    MealsPerWeek INT NOT NULL,
    StartingPrice DECIMAL(7,2) NOT NULL,
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

CREATE TABLE IF NOT EXISTS Ingredients (
    Ingredient VARCHAR(128) NOT NULL,
    Meal VARCHAR(50) NOT NULL,
    FOREIGN KEY (Meal) REFERENCES Meals(Actual_Meal)
);

--  need schema for PaymentAdjustments table
