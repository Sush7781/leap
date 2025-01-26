FROM python:3.11-slim

# Set working directory
WORKDIR /leap

# Copy application files
COPY app.py ./
COPY requirements.txt ./
COPY Sample.xlsx ./

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt --verbose

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

