FROM docker.getcollate.io/openmetadata/ingestion:1.6.1

# Switch to root to install dependencies
USER root
RUN chmod -R 775 /opt/airflow && chown -R airflow:airflow /opt/airflow
# Install git and any other dependencies
RUN apt-get update && apt-get install -y git && apt-get clean

# Switch back to airflow user
USER airflow
