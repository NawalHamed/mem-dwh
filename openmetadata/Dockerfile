# Use the OpenMetadata ingestion image as the base
FROM docker.getcollate.io/openmetadata/ingestion:1.6.1

# Switch to root user to install additional system packages
USER root

# Install necessary system packages for your environment
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to airflow user
USER airflow

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip

# Copy requirements file for installing Python dependencies
COPY requirements.txt /requirements.txt

# Install dependencies from requirements file
RUN pip install --no-cache-dir -r /requirements.txt

# Set Airflow working directory
WORKDIR /opt/airflow

# Copy local DAGs folder to Airflow's DAGs folder
COPY ./dags /opt/airflow/dags
