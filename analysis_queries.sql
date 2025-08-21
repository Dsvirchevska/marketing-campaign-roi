## ROI per Campaign

SELECT 
    c.campaign_name,
    SUM(f.revenue) AS total_revenue,
    SUM(f.spend_amount) AS total_spend,
    ROUND((SUM(f.revenue) - SUM(f.spend_amount)) / NULLIF(SUM(f.spend_amount),0), 2) AS roi
FROM fact_campaign_performance f
JOIN dim_campaigns c ON f.campaign_id = c.id
GROUP BY c.campaign_name
ORDER BY roi DESC;

## Response Rate by Customer Segmen

SELECT 
    d.education,
    d.marital_status,
    COUNT(*) AS targeted,
    SUM(f.response) AS responses,
    ROUND(SUM(f.response)::numeric / COUNT(*), 3) AS response_rate
FROM fact_campaign_performance f
JOIN dim_customers d ON f.customer_id = d.id
GROUP BY d.education, d.marital_status
ORDER BY response_rate DESC;

## Channel ROI

SELECT 
    c.channel,
    SUM(f.revenue) AS total_revenue,
    SUM(f.spend_amount) AS total_spend,
    ROUND((SUM(f.revenue) - SUM(f.spend_amount)) / NULLIF(SUM(f.spend_amount),0), 2) AS roi
FROM fact_campaign_performance f
JOIN dim_campaigns c ON f.campaign_id = c.id
GROUP BY c.channel
ORDER BY roi DESC;



