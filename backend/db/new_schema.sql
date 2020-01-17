DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer (
    country VARCHAR(2),
    email VARCHAR(255),
    first_name VARCHAR(255),
    id VARCHAR(32),
    last_name VARCHAR(255),
    location VARCHAR(64),
    name VARCHAR(255),
    PRIMARY KEY (email)
);

DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product (
    deleted BOOL,
    id VARCHAR(32),
    mp_visible BOOL,
    name VARCHAR(255),
    single_purchasable BOOL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS product_instance;
CREATE TABLE IF NOT EXISTS product_instance (
    deleted BOOL,
    gift BOOL,
    id VARCHAR(32),
--  images []
--  inventory: null
    price: INT,
    product_id VARCHAR(32),
    ship_weight DECIMAL(8,2),
    sku VARCHAR(32),
--  term_prices []
--  variants []
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

DROP TABLE IF EXISTS product_instance_subscription_type_term_price;
CREATE TABLE IF NOT EXISTS product_instance_subscription_type_term_price (
    id VARCHAR(32),
    instance_id VARCHAR(32),
    price INT,
    term_id VARCHAR(32)
    FOREIGN KEY (instance_id) REFERENCES product_instance(id)
);

DROP TABLE IF EXISTS fulfillments;
CREATE TABLE IF NOT EXISTS fulfillments (
    adjusted_fulfillment_date VARCHAR(255),
    cycle_number INT,
    fulfillment_date VARCHAR(255),
    id VARCHAR(32),
    instance_id VARCHAR(32),
    is_test BOOL,
--  order [] CURRENT
    FOREIGN KEY (instance_id) REFERENCES product_instance(id)
);

DROP TABLE IF EXISTS shipments;
CREATE TABLE IF NOT EXISTS shipments (
    adjusted_ordered_at VARCHAR(255),
    created_at VARCHAR(255),
    customer_id VARHCAR(32),
--  feedback_responses []
--  fullfillments []
    id VARCHAR(32),
    is_gift BOOL,
    is_test BOOL,
    ship_address_id VARCHAR(32),
    shipped_at VARCHAR(255),
    status VARCHAR(255),
    target_at VARCHAR(255),
    tracking_number VARCHAR(255),
    url VARCHAR(255),
    FOREIGN KEY (customer_email) REFERENCES customer(email),
    FOREIGN KEY (ship_address_id) REFERENCES ship_address(id)
);
