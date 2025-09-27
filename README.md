# telecom_clv_portfolio
# Telecom Customer Lifetime Value (CLV) Analysis

This project explores Customer Lifetime Value (CLV) in the telecom industry using MySQL for data preparation and Tableau for visualization.
The dataset is based on the Telecom Customer Churn dataset from Kaggle.

---

## Repository Contents

* `telecom_clv.sql` → Full SQL dump (structure + data).
* `clv_queries.sql` → SQL scripts for CLV calculation and segmentation.
* `README.md` → Project documentation.

---

## Key Steps

1. **Data Preparation**

   * Imported dataset into MySQL.
   * Created a `clv` table with customer attributes.
   * Added calculated column `est_clv` for Customer Lifetime Value.

2. **CLV Calculation**

   ```sql
   ALTER TABLE clv ADD COLUMN est_clv DECIMAL(15,2);
   UPDATE clv
   SET est_clv = tenure * monthly_charges;
   ```

3. **Customer Segmentation**

   ```sql
   ALTER TABLE clv ADD COLUMN segment VARCHAR(20);
   UPDATE clv
   SET segment =
       CASE
           WHEN est_clv < 2000 THEN 'Bronze'
           WHEN est_clv BETWEEN 2000 AND 5000 THEN 'Silver'
           WHEN est_clv BETWEEN 5001 AND 10000 THEN 'Gold'
           ELSE 'Platinum'
       END;
   ```

---
<img width="1200" height="578" alt="image" src="https://github.com/user-attachments/assets/5330c978-6fb2-4608-884e-d4bd68709f64" />

## Insights

* 60% of customers fall into the **Bronze** group (< $2000 CLV).
* **Platinum customers** (long tenure, higher monthly charges) provide the highest CLV.
* Customers paying via **auto bank withdrawal** show higher CLV, while **mailed checks** are lowest.
* **Two-year contract customers** have significantly higher CLV compared to month-to-month contracts.

---

## Recommendations

* **Focus on Platinum & Gold Customers**
  Provide rewards, priority support, and retention programs.

* **Upgrade Bronze & Silver Customers**
  Offer bundles, promos, or personalized marketing campaigns.

* **Use CLV as Customer Flagging System**

  * Platinum → Priority support when reporting issues.
  * Bronze/Silver → Marketing campaigns to increase loyalty.

* **Monitor CLV by Tenure**
  Identify long-tenure but low-CLV customers to prevent churn.

---

## How to Use

1. Import `telecom_clv.sql` into MySQL:

   ```bash
   mysql -u your_user -p telecom_clv < telecom_clv.sql
   ```
2. Run queries from `clv_queries.sql` for segmentation and insights.
3. Connect MySQL to Tableau and create dashboards.

