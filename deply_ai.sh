#!/bin/bash

# --- Local AI Infrastructure Deployment Script ---
# Author: rukasumoraisu
# Purpose: Deploy an Uncensored Research AI (Ollama + Open WebUI)

echo "Step 1: Creating Docker Configuration..."

# Creating the docker-compose file on the fly
cat << 'DOCKER' > docker-compose.yaml
services:
  ollama:
    image: ollama/ollama:latest
    container_name: ollama
    volumes:
      - ollama_data:/root/.ollama
    restart: always

  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    ports:
      - "3000:8080"
    environment:
      - OLLAMA_BASE_URL=http://ollama:11434
    volumes:
      - open-webui_data:/app/backend/data
    depends_on:
      - ollama
    restart: always

volumes:
  ollama_data:
  open-webui_data:
DOCKER

echo "Step 2: Starting Containers..."

docker compose up -d

echo "⏳ Waiting for Ollama service to wake up..."
sleep 5

echo "🧠 Step 3: Pulling Uncensored Model (Dolphin-Llama3)..."

echo "------------------------------------------------"
echo "Environment is READY!"
echo "URL: http://localhost:3000"
echo "Model: dolphin-llama3 (Unfiltered)"
echo "------------------------------------------------"
