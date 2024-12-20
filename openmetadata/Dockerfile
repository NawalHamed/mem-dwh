# Base ingestion image
FROM docker.getcollate.io/openmetadata/ingestion:1.6.1

# Update packages and install dependencies
RUN apt-get update && apt-get install -y git && apt-get clean

# Install dbt and its dependencies
RUN pip install apache-airflow-providers-airbyte==3.2.1 --no-deps && \
    pip install dbt-core dbt-postgres --no-cache-dir

# Create necessary directories
RUN mkdir -p /opt/airflow/dags/dbt_project

# Entrypoint script will handle runtime operations
CMD ["/bin/bash"]
