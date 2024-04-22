from flask import Flask, request, jsonify
from chatbot import create_qa_chain, generate_response

app = Flask(__name__)

# Initialize the QA chain once when the server starts
qa_chain = create_qa_chain()

@app.route('/', methods=['POST'])
def chat():
    # Extract the message from the request
    data = request.get_json()
    if not data or 'message' not in data:
        return jsonify({'error': 'No message provided'}), 400

    # Get the message from the received JSON
    message = data['message']

    # Generate response using the chatbot
    try:
        response = generate_response(query=message, qa_chain=qa_chain)
        return jsonify({'response': response})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
