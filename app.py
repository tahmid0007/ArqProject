from flask import Flask, jsonify, request
from flask_restful import reqparse, abort, Api, Resource
from transformers import pipeline

app = Flask(__name__)
api = Api(app)
model = pipeline("sentiment-analysis") 

class arqProject(Resource):
    def get(self):
        json_data = request.get_json(force=True) # receive the user input 
        sentence = json_data['sentence'] # parse the input sentecne
        prediction = model(sentence)[0] # run inference on the sentence
        score = int(prediction['score']*100) # standardize the prediction confidence as a rounded int within 0-100
        return jsonify(Sentiment = prediction['label'], score = score) #return the sentiment and score as JSON



api.add_resource(arqProject, '/') # This is the root, i.e., a curl hit to the localhost:80 will invoke the function arqProject

    
if __name__ == '__main__':
    app.run(host='0.0.0.0',port = 80, debug=True) # Bind to local host at port 80