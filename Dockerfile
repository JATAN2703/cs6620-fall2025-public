# 3.11 because pydub needs audioop, which was removed in 3.13
FROM python:3.11-slim

WORKDIR /app

# Dependencies first so this layer stays cached when only code changes
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=app.py
EXPOSE 5000

# app.py hardcodes port 3000, so start it through the Flask CLI on 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
