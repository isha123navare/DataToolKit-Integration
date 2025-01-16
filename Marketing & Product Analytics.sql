—1) Marketing Analytics

—a. Analyze marketing campaign performance by channel (spend, conversions, and conversion rate)

SELECT 
    channel, 
    SUM(spend) AS total_spend, 
    SUM(conversions) AS total_conversions, 
    ROUND((SUM(conversions) * 100.0 / SUM(clicks)), 2) AS conversion_rate
FROM 
    Marketing_Events
GROUP BY 
    channel;


—b.Calculate the Cost Per Acquisition (CPA) for each campaign

SELECT 
    campaign_id, 
    channel, 
    spend, 
    conversions, 
    ROUND(spend / NULLIF(conversions, 0), 2) AS CPA
FROM 
    Marketing_Events;


—c. Identify the most cost-effective channels in terms of conversions

SELECT 
    channel, 
    ROUND(SUM(spend) / NULLIF(SUM(conversions), 0), 2) AS cost_per_conversion
FROM 
    Marketing_Events
GROUP BY 
    channel
ORDER BY 
    cost_per_conversion ASC;




—2) Product Analytics
—a. Analyze feature adoption rates (number of users engaging with specific features)

SELECT 
    feature_name, 
    COUNT(DISTINCT user_id) AS unique_users
FROM 
    App_Events
GROUP BY 
    feature_name;


—b. Calculate Daily Active Users (DAU)

SELECT 
    event_date, 
    COUNT(DISTINCT user_id) AS daily_active_users
FROM 
    App_Events
WHERE 
    event_date IS NOT NULL
GROUP BY 
    event_date
ORDER BY 
    event_date ASC;

—c. Calculate Weekly Active Users (DAU)

SELECT 
    FORMAT_DATE('%Y-%W', DATE_TRUNC(DATE(event_date), WEEK(MONDAY))) AS week, 
    COUNT(DISTINCT user_id) AS weekly_active_users
FROM 
    App_Events
GROUP BY 
    week
HAVING 
    week IS NOT NULL
ORDER BY 
    week ASC;


—d. Perform cohort analysis to track user retention over time.
WITH User_Cohorts AS (
    SELECT 
        user_id, 
        MIN(event_date) AS cohort_date
    FROM 
        App_Events
    GROUP BY 
        user_id
),
Retention AS (
    SELECT 
        uc.cohort_date, 
        STRFTIME('%Y-%m-%d', ae.event_date) AS active_date,
        COUNT(DISTINCT ae.user_id) AS active_users
    FROM 
        User_Cohorts uc
    JOIN 
        App_Events ae
    ON 
        uc.user_id = ae.user_id
    GROUP BY 
        uc.cohort_date, active_date
)
SELECT 
    cohort_date, 
    active_date, 
    active_users
FROM 
    Retention
ORDER BY 
    cohort_date, active_date;

—e. Analyse average session duration per feature and user location.
SELECT 
    ae.feature_name, 
    u.location, 
    ROUND(AVG(ae.session_duration), 2) AS avg_session_duration
FROM 
    App_Events ae
JOIN 
    Users u
ON 
    ae.user_id = u.user_id
GROUP BY 
    ae.feature_name, u.location
ORDER BY 
    feature_name, location;

—f. Filters to segment data by country, device type, and feature.

SELECT 
    ae.feature_name,
    ud.location AS country,
    ud.device_type,
    AVG(ae.session_duration) AS avg_session_duration
FROM 
    App_Events ae
JOIN 
    Users ud
ON 
    ae.user_id = ud.user_id  -- Assuming 'user_id' is the common key between the two tables
WHERE
    ud.location IS NOT NULL  -- Filters out null values in location (country)
    AND ud.device_type IS NOT NULL  -- Filters out null values in device_type
    AND ae.feature_name IN ('Login', 'Purchase')  -- Filters for specific features if needed
GROUP BY 
    ae.feature_name, ud.location, ud.device_type
ORDER BY 
    country, ud.device_type, ae.feature_name;
