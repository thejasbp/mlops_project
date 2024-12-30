# Use Python 3.12 as the base image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /flask_app

# Copy only requirements.txt first to leverage Docker caching
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Ensure setuptools is installed (required by MLflow)
RUN pip install --no-cache-dir setuptools

# Copy the application files into the container
COPY app/ .

# Copy the test files (if necessary for testing within the container)
COPY tests/ app/tests/

# Expose the necessary port for the Flask app (and MLflow if needed)
EXPOSE 8000

# Start MLflow server in the background and then run your Flask app
CMD mlflow server --host 0.0.0.0 --port 8000 & \
    python app.py

