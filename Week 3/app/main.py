from flask import Flask
import os

app = Flask (__name__)

@app.route('/')
def hello():
    # home_dir = os.environ.get('pranjalenv')
    # print(home_dir)
    return "Hello Everyone"

app.run(host='0.0.0.0',port=8080,debug=True)
