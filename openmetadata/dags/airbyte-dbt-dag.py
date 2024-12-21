from datetime import datetime, timedelta
#from dbt.exceptions import RuntimeException
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.datasets import Dataset
import requests
from airflow.utils.dates import days_ago
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator  
from pathlib import Path

#AIRBYTE_HOST = 'http://localhost:8000' # replace with your Airbyte host
CONNECTION_ID_1 = '96dda4e3-c9c9-4f25-bfff-1ceb1dd5aaad'  # replace with your connection id
CONNECTION_ID_2 = '8f903471-1b56-4202-b751-f26edbe8aebc'
default_args = { 
    'owner': 'airflow',
    'depends_on_past': False, 
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
} 



# Define the DAG
with DAG(
    'airbyte_dbt_execution_dag',
    default_args=default_args,
    description="DAG to trigger Airbyte sync and run DBT commands",
    schedule_interval='@daily',
    start_date=datetime(2023, 12, 1),
    catchup=False,  # Prevents backfilling of previous runs
) as dag:

# Task 1 to schedule airbyte
    trigger_airbyte_connection= AirbyteTriggerSyncOperator(
        task_id='airbyte_sync_Jadawel',
        airbyte_conn_id='airbyte_conn',  # this is the ID of the connection we created on Airflow between airbyte and airflow
        connection_id=CONNECTION_ID_1, # Get this ID from the URL of the connection in AIRBYTE between source and destination postgres
        asynchronous=False,
    )


 # Task 2: Trigger the second Airbyte connection
    trigger_airbyte_connection_2 = AirbyteTriggerSyncOperator(
        task_id="airbyte_sync_QVD",
        airbyte_conn_id="airbyte_conn",  # Airbyte connection ID in Airflow
        connection_id=CONNECTION_ID_2,  # Second Airbyte connection ID
        asynchronous=False,
    )

    
# Task 3 to schedule dbt

dbt_run = BashOperator(
    task_id="dbt_run",
    bash_command=(
        "docker exec -it dbt-container sh -c "
        "'cd /dbt/mem_dwh && dbt debug --profiles-dir ./mem_dwh'"
    ),
)


trigger_airbyte_connection >> trigger_airbyte_connection_2 >> dbt_run 
# task 1 >> task 2 >> task3