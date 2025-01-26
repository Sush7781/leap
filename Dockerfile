FROM python:3.11-slim

# Set working directory
WORKDIR /leap

# Copy application files into the container
COPY app.py ./
COPY requirements.txt ./  # Ensure requirements.txt is copied here
COPY Sample.xlsx ./

# Install virtualenv if not already installed
RUN pip install --upgrade pip && \
    pip install virtualenv

# Create a virtual environment and activate it
RUN python3 -m venv /leap/venv

# Set the virtual environment as the active environment
ENV PATH="/leap/venv/bin:$PATH"

# Install dependencies in the virtual environment
RUN pip install -r requirements.txt --verbose

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
