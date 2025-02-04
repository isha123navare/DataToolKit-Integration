# DataToolKit-Integration

## Dataset Link:

https://docs.google.com/spreadsheets/d/1cExDULi1-nNik787nHkB6JVyH5dGCB9E/edit?usp=sharing&ouid=117667187169577427146&rtpof=true&sd=true

## Dataset Contains:

1. Users dataset: user_id, age, gender, location, device_type

2. App Events dataset: user_id, event_id, feature_name, event_date, session_duration
Marketing Events dataset:

3. campaign_id, channel, spend, clicks, conversions, event_date

## Link to the Visualization: 

https://lookerstudio.google.com/reporting/db1315d2-26a8-43ba-9ad4-0c4d379d2ac9


## Worked On: 

## 1. Dataset Preparation and BigQuery Analysis

a. Uploaded and organized datasets into Google BigQuery, including Users, App Events, and Marketing Events.

b. Conducted SQL queries to extract actionable insights, demonstrating proficiency in:

c. Aggregating data with functions like SUM, COUNT, and ROUND.

d. Handling dataset joins (JOIN) to combine information from multiple tables.

e. Using advanced SQL techniques, including WITH clauses for temporary tables and cohort analysis.

f. Ensured data integrity and completeness by applying filters to exclude null or irrelevant data.

## 2. Marketing Analytics

**1. Campaign Performance Analysis:**

a. Analyzed key metrics (spend, conversions, conversion rate) by channel to measure performance.

b. Leveraged SQL to calculate conversion rates using click-through and conversion metrics, showcasing analytical and problem-solving skills.

**2. Cost Per Acquisition (CPA):**

a. Calculated CPA for each campaign using SQL queries, highlighting channels with the lowest CPA.

b. Sorted CPA metrics in ascending order to identify cost-effective channels.

**3. Cost-Effectiveness Analysis:**

a. Identified the most efficient marketing channels by evaluating the cost per conversion, providing actionable insights for campaign optimization.

## 3. Product Analytics

**1. Feature Adoption Rates:**

a. Used SQL to calculate how many unique users interacted with specific app features, showing knowledge of user engagement tracking.

**2. Daily/Weekly Active Users (DAU/WAU):**

a. Analyzed user activity trends by calculating daily and weekly active users, using date-based grouping and formatting (FORMAT_DATE and DATE_TRUNC).

b. Extracted and organized data for a time series visualization.

**3. Cohort Analysis:**

a. Created user cohorts based on their first interaction (cohort_date) to track retention over time.

b. Performed temporal analysis to understand how user activity evolved post-signup.

**4. Session Duration Analysis:**

a. Measured average session duration per feature and user location using AVG to assess engagement quality.

**5. Filters for Segmentation:**

a. Designed queries to segment data by country, device type, and features for granular analysis.

b. Enabled filtering to drill down into specific segments for targeted insights.


## Key Insights
1. Email is the Best-Performing Channel by Conversion Rate: Email has the highest conversion rate at 5.51%, indicating that campaigns run via email are most effective at converting clicks into actions compared to other channels. This makes email a valuable channel for targeted marketing, especially for customer retention or promotions.
   
2. Paid Search Drives the Highest Total Conversions: Paid Search has the highest total conversions (25,917) among all channels, despite a slightly lower conversion rate (5.18%). This suggests it is excellent for volume-driven campaigns, likely benefiting from broader reach.

3. The "Review" and "Purchase" features are the most widely adopted, with 92 and 91 unique users, respectively, indicating strong user engagement with these functionalities.

4. Denmark leads with the longest average session duration for the "Login" feature, with an average of 6,21 minutes, suggesting strong user engagement during login.
