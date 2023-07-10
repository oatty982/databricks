-- Databricks notebook source
USE itversity_retail_bronze

-- COMMAND ----------

SHOW tables

-- COMMAND ----------

INSERT OVERWRITE DIRECTORY '${gold_base_dir}/daily_product_revenue'
USING PARQUET
SELECT o.order_date,
    oi.order_item_product_id,
    round(sum(oi.order_item_subtotal), 2) AS revenue
FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_item_order_id
WHERE o.order_status IN ('COMPLETE', 'CLOSED')
GROUP BY 1, 2

-- COMMAND ----------

SELECT * FROM PARQUET.`${gold_base_dir}/daily_product_revenue`
ORDER BY 1, 2 DESC

-- COMMAND ----------


