# Use the official DBT image as a base
FROM fishtownanalytics/dbt:latest

# Set the working directory
WORKDIR /dbt

# Copy your DBT project files into the container
COPY ./dbt_project /dbt

# Copy the profiles.yml file to the DBT configuration directory
COPY ./profiles.yml /root/.dbt/profiles.yml

# Install any additional dependencies if needed (uncomment and modify)
# RUN apt-get update && apt-get install -y <additional-packages>

# Default command to keep the container running
CMD ["dbt", "run"]
