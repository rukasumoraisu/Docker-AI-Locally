cat << 'EOF' > deploy_ai.sh
#!/bin/bash

echo "Starting Local AI Environment..."

# 1. Check if Docker is running!

# 2. Start or Create the Container
CONTAINER_NAME="open-webui"
IMAGE_NAME="ghcr.io/open-webui/open-webui:main"

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "📦 Container exists. Powering up..."
    docker start $CONTAINER_NAME
else
    echo "🔨 Creating new container instance..."
    docker run -d -p 3000:8080 \
      --add-host=host.docker.internal:host-gateway \
      -v open-webui:/app/backend/data \
      --name $CONTAINER_NAME \
      $IMAGE_NAME
fi

# 3. Model Verification & Pulling
echo "🧠 Verifying Unfiltered Model: Dolphin-Llama3..."
echo "Note: If this is the first run, the download may take a few minutes."

# We use 'ollama pull' to ensure the model is available without entering interactive mode
docker exec -it $CONTAINER_NAME ollama pull dolphin-llama3

echo "------------------------------------------------"
echo "✅ Deployment Successful!"
echo "🌐 Access the Interface: http://localhost:3000"
echo "------------------------------------------------"
EOF

chmod +x deploy_ai.sh
