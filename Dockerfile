FROM nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04

WORKDIR /app

# Install system dependencies
RUN apt update && apt dist-upgrade -y
RUN apt install software-properties-common -y
RUN apt-get install -y wget curl

# Add deadsnakes PPA for newer Python versions
RUN add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.10
RUN apt-get update && apt-get install -y python3.10 python3.10-distutils python3.10-dev

# Install pip for Python 3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Upgrade pip
RUN python3.10 -m pip install --upgrade pip

COPY requirements_cuda.txt .
RUN pip install --no-cache-dir -r requirements_cuda.txt

COPY . .

CMD ["python3.10", "main.py"]
