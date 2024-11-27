# Use a minimal Python base image
FROM python:3.10-slim

# Set a Linux-like working directory for development
WORKDIR /workspace

# Copy your requirements.txt into the container
COPY requirements.txt /workspace/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project code
COPY . /workspace/

# Keep the container alive for interactive development
CMD ["bash"]