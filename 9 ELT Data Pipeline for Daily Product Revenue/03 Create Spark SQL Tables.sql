-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS itversity_retail_bronze

-- COMMAND ----------

USE itversity_retail_bronze

-- COMMAND ----------

CREATE EXTERNAL TABLE IF NOT EXISTS ${table_name}
USING PARQUET
OPTIONS (
    path='${bronze_base_dir}/${table_name}'
)

-- COMMAND ----------


