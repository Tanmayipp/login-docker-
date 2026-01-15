# Use official Python slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port 8000 for Django server
EXPOSE 8000

# Run Django development server on all interfaces
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
