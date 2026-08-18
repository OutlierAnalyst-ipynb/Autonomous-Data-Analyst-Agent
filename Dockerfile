# Use Python 3.13 slim as the base image
FROM python:3.13-slim

# Install system dependencies needed for Ollama and the SQLite CLI
RUN apt-get update && apt-get install -y \
    curl \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Install the Ollama application
RUN curl -fsSL https://ollama.com/install.sh | sh

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Start the Ollama server in the background and pull ONLY the qwen2.5-coder model
RUN ollama serve & \
    sleep 5 && \
    ollama pull qwen2.5-coder

# Copy the rest of the project files into the container
# (Ensure your Autonomous_Agent.ipynb and CSV file are in the same directory)
COPY . /app/

# Expose ports for Jupyter Lab (8888) and Ollama API (11434)
EXPOSE 8888 11434

# Entrypoint to start both the Ollama server and Jupyter Lab simultaneously
CMD bash -c "ollama serve & sleep 5 && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"