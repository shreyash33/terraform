FROM python
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
ENV FLASK_APP=app
ENV FLASK_DEBUG=1
CMD  ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]