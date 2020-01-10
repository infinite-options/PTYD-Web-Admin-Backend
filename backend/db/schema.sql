-- Ingredients has foreign key referenced in Meals
DROP TABLE IF EXISTS Ingredients;

DROP TABLE IF EXISTS Meals;
CREATE TABLE IF NOT EXISTS Meals (
    Meal_ID VARCHAR(16) NOT NULL,
    Meals VARCHAR(20) NOT NULL,
    Actual_Meal VARCHAR(50) NOT NULL,
    Calories INT NOT NULL,
    Protein DECIMAL(6,2) NOT NULL,
    Carbs DECIMAL(6,2) NOT NULL,
    Sugar DECIMAL(6,2) NOT NULL,
    Fiber DECIMAL(6,2) NOT NULL,
    Fat DECIMAL(6,2) NOT NULL,
    Sat DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (Meal_ID)
);

DROP TABLE IF EXISTS Subscriptions;
CREATE TABLE IF NOT EXISTS Subscriptions (
    shipment_id VARCHAR(16) NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    customer_name VARCHAR(64) NOT NULL,
    customer_email VARCHAR(64) NOT NULL,
    ship_to VARCHAR(64) NOT NULL,
    ship_company VARCHAR(512),
--  customer_first VARCHAR(32) NOT NULL,
--  customer_last VARCHAR(32) NOT NULL,
    ship_street VARCHAR(32) NOT NULL,
    ship_unit VARCHAR(16),
    ship_city VARCHAR(16) NOT NULL,
    ship_phone_number VARCHAR(10) NOT NULL,
    ship_state VARCHAR(2) NOT NULL,
    ship_zip_code VARCHAR(10) NOT NULL,
    ship_country VARCHAR(2) NOT NULL,
    verification_status VARCHAR(64),
    verification_message VARCHAR(64),
    shipment_status VARCHAR(64),
    first_shipment VARCHAR(64),
    shipment_number VARCHAR(64),
    order_id VARCHAR(64),
    order_date DATETIME,
    target_ship_date DATETIME,
    subscription_cycle_count INT,
    customer_cycle_count INT,
    customer_notes VARCHAR(256),
    subscription_notes VARCHAR(256),
    subscription_term VARCHAR(64),
    tracking_number VARCHAR(64),
    subscription_metadata VARCHAR(256),
    cart_metadata VARCHAR(256),
    is_gift BOOL,
    gift_message VARCHAR(256),
    subscription_id VARCHAR(64),
    will_renew BOOL,
    gift_recipient_name VARCHAR(64),
    gift_recipient_email VARCHAR(64),
    shipped_at_date DATETIME,
    product_0_id VARCHAR(32),
    product_0_instance_id VARCHAR(32),
    product_0_name VARCHAR(18),
    product_0_sku VARCHAR(14),
    product_1_id VARCHAR(32),
    product_1_instance_id VARCHAR(32),
    product_1_name VARCHAR(18),
    product_1_sku VARCHAR(14),
    product_1_Flavor VARCHAR(32),
    product_0_FLAVOR_2 VARCHAR(32),
    product_0_FLAVOR_1 VARCHAR(32)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
    Date_Submitted DATETIME NOT NULL,
    Last_Name VARCHAR(32),
    First_Name VARCHAR(32),
    Email VARCHAR(64),
    Delivery_Time VARCHAR(176),
    Phone_Number VARCHAR(10),
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
    Pick_Meals VARCHAR(41)
);

--  DROP TABLE IF EXISTS MealPlans;
CREATE TABLE IF NOT EXISTS MealPlans (
    MealsPerWeek INT NOT NULL,
    PlanSummary VARCHAR(255),
    PlanFooter VARCHAR(64),
    Img VARCHAR(512),
    RouteOnclick VARCHAR(128)
);

--  DROP TABLE IF EXISTS PaymentPlans;
CREATE TABLE IF NOT EXISTS PaymentPlans (
    MealsPerWeek INT NOT NULL,
    WeekToWeek BOOL NOT NULL,
    WeekToWeekPrice DECIMAL(7,2),
    TwoWeekPrePay BOOL NOT NULL,
    TwoWeekPrice DECIMAL(7,2),
    FourWeekPrePay BOOL NOT NULL,
    FourWeekPrice DECIMAL(7,2)
);

--  DROP TABLE IF EXISTS PaymentAdjustments;
CREATE TABLE IF NOT EXISTS PaymentAdjustments (
    PromoCode VARCHAR(64) NOT NULL,
    Reduction INT NOT NULL,
    Unit VARCHAR(32) NOT NULL,
    AppliesTo VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS Ingredients (
    Ingredient VARCHAR(128) NOT NULL,
    Meal VARCHAR(50) NOT NULL,
    Qty INT NOT NULL,
    Unit VARCHAR(32) NOT NULL,
    FOREIGN KEY (Meal) REFERENCES Meals(Meal_ID)
);

--  DROP TABLE IF EXISTS UnitConversion;
CREATE TABLE IF NOT EXISTS UnitConversion (
    BuyUnit VARCHAR(64) NOT NULL,
    IngredientUnit VARCHAR(64) NOT NULL
);
