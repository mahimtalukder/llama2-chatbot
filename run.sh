docker build . -t chatbot:latest
docker tag chatbot:latest gcr.io/applied-abbey-356818/chatbot:latest
docker push gcr.io/applied-abbey-356818/chatbot:latest