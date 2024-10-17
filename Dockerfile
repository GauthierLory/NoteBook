FROM python:3.9-slim

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Installer virtualenv
RUN pip install virtualenv

# Créer un environnement virtuel et l'activer
RUN virtualenv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Installer les bibliothèques Python dans l'environnement virtuel
RUN pip install openai python-dotenv

WORKDIR /app

EXPOSE 8888

# Lancer Jupyter Notebook
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]
