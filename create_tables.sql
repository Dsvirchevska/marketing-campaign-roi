-- Dimension Tables
CREATE TABLE dim_customers (
    id INT PRIMARY KEY,
    age INT,
    education VARCHAR(50),
    marital_status VARCHAR(50),
    income NUMERIC
);

CREATE TABLE dim_campaigns (
    id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    channel VARCHAR(50)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    week INT
);

-- Fact Table
CREATE TABLE fact_campaign_performance (
    id INT PRIMARY KEY,
    campaign_id INT,
    customer_id INT,
    spend_amount NUMERIC,
    response INT,
    purchases INT,
    revenue NUMERIC,
    date_id INT,
    FOREIGN KEY (campaign_id) REFERENCES dim_campaigns(id),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
