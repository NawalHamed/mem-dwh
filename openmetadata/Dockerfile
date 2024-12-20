# Start with the base ingestion image
FROM docker.getcollate.io/openmetadata/ingestion:1.6.1

# Install necessary dependencies
RUN apt-get update && apt-get install -y git

# Ensure the DAGs directory exists
RUN mkdir -p /opt/airflow/dags/dbt_project

# Clone the repository during the build (optional, for testing)
RUN git clone https://github.com/NawalHamed/mem-dwh.git /opt/airflow/dags/dbt_project || true

# Install dbt and its PostgreSQL adapter
RUN pip install apache-airflow-providers-airbyte==3.2.1 --no-deps && \
    pip install dbt-core dbt-postgres --no-cache-dir
