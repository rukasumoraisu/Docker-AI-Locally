# Docker-AI-Locally
Run your own AI locally on localhost:3000 with fast setup and local persistence!

This project provides a fully containerized, local environment for interacting with Large Language Models (LLMs) without corporate filters or data privacy concerns. It is designed for advanced academic and technical research.

The environment leverages **Docker** to orchestrate two primary components:
1.  **Backend (Ollama):** Manages the weights and execution of the LLM.
2.  **Frontend (Open WebUI):** Provides a ChatGPT-like interface for seamless interaction, document management (RAG), and model orchestration.

### Key Features
* **Privacy-First:** All data remains on the local machine. No external API calls are made for inference.
* **Unfiltered Models:** Pre-configured to use **Dolphin-Llama3**.
* **RAG Support:** Built-in Retrieval-Augmented Generation capabilities—upload PDFs or text files to chat with your local documents.

## Prerequisites

* [Docker](https://www.docker.com/) installed and running.
* (Optional) **NVIDIA Container Toolkit** for GPU acceleration.

## Starting

1.  **Clone the repository and enter the directory:**
    ```bash
    cd Docker-AI-Locally
    ```

2.  **Execute the deployment script:**
    ```bash
    chmod +x deply_ai.sh
    ./deply_ai.sh
    ```

3.  **Final Configuration (Required):**
    After logging in for the first time, you must link the services:
    * Go to **Settings** > **Admin Settings** > **Connections**.
    * **Disable** the **OpenAI API** service (toggle the switch to OFF).
    * Under **Ollama API**, change the address to: `http://ollama:11434`
    * Click the **Refresh** icon next to the address to confirm the connection (it should show a green success message).

4.  **Access the interface:**
    Open [http://localhost:3000](http://localhost:3000) in your browser.

## Model Information: Dolphin-Llama3

This environment uses the **Dolphin-Llama3** model. Unlike standard models (like GPT-4 or Llama-Chat), Dolphin models are:
* **Compliant:** They follow instructions without moralizing or refusing prompts.
* **Uncensored:** Trained on datasets filtered to remove refusals, allowing for advanced research into cybersecurity, chemistry, and other restricted fields.

---
*Created for advanced study and technical research purposes.*
