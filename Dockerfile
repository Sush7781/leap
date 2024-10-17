from python:3.12
run pip install && apt-get-update
workdir /leap
copy app_1.py ./
ENV port 80
EXPOSE 80
CMD ["python3.12","app_1.py"]
