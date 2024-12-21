FROM docker.getcollate.io/openmetadata/ingestion:1.6.1

# Switch to root to install dependencies
USER root

# Create and adjust permissions for Airflow directories
RUN mkdir -p /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins \
    && chmod -R 775 /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins \
    && chown -R airflow:airflow /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins

# Fix potential issues with home directory
RUN mkdir -p /home/airflow && chown -R airflow:airflow /home/airflow

# Install git and any other dependencies
RUN apt-get update && apt-get install -y git && apt-get clean

# Switch back to airflow user
USER airflow
