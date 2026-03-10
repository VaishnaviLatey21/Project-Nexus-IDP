from flask import Flask, request
import requests
import os

app = Flask(__name__)

@app.route("/process")
def process():
    return "Processed by Python Worker"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
