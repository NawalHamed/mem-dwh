# Use a specific Airflow base image
FROM apache/airflow:2.10.2-python3.10

# Switch to root user for installing system dependencies
USER root

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ensure airflow user has proper permissions
RUN groupadd -g 1000 airflow && \
    usermod -g airflow airflow

# Switch to airflow user
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
