FROM python:3-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 5000

ENV FLASK_ENV=development
CMD ["flask", "run","--host=0.0.0.0"]
