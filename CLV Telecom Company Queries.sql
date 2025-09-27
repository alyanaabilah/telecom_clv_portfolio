# create table
CREATE TABLE clv (
    customer_id VARCHAR(50) PRIMARY KEY,
    tenure INT,
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    contract VARCHAR(50),
    payment_method VARCHAR(100),
    internet_service VARCHAR(50)
); 

# create alter table
ALTER TABLE clv
ADD COLUMN tenure_group VARCHAR(20)
    AS (
        CASE
            WHEN tenure <= 12 THEN 'Short-term'
            WHEN tenure BETWEEN 13 AND 36 THEN 'Mid-term'
            ELSE 'Loyal'
		END
	) STORED;

# average clv query
SELECT AVG(est_clv) AS avg_clv FROM clv;

# contract by clv query
SELECT contract, AVG(est_clv) AS avg_clv
FROM clv
GROUP BY contract;

# top 10 highest clv
SELECT customer_id, est_clv, contract
FROM clv
ORDER BY est_clv DESC
LIMIT 10;

# segment by clv
SELECT segment, COUNT(*) AS total_customers 
FROM clv
GROUP BY segment;
 
 
use telecom_clv;









