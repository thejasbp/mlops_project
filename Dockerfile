# Use an appropriate base image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /flask_app

# Copy the application files into the container
COPY . /flask_app/

# Install dependencies (add setuptools if not already included)
RUN pip install --no-cache-dir -r requirements.txt

# Ensure setuptools is installed
RUN pip install --no-cache-dir setuptools

# Expose the application port (if necessary)
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]
