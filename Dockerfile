FROM python:3.9.14-slim

RUN pip install pipenv

WORKDIR /app
COPY ["Pipfile", "Pipfile.lock", "./"]

RUN pipenv install --system --deploy

COPY ["predict.py", "model_C=1.0.bin", "./"]

EXPOSE 8080

ENTRYPOINT ["waitress-serve", "--port=9696", "predict:app"]


