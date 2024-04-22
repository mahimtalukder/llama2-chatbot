FROM python:3.10-slim-bullseye

WORKDIR /app

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y build-essential

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "main.py"]
