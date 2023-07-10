# Databricks notebook source
arg = dbutils.widgets.get('arg')

# COMMAND ----------

print(f'Hello, {arg} from Notebook 03a')