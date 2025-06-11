from flask import Flask, render_template, request, jsonify
import requests

app = Flask(__name__)

@app.route('/')
def home():
    response = requests.get('https://product-backend-327554758505.us-central1.run.app/products')
    products = response.json()
    return render_template('index.html', products=products)  

@app.route('/decrement_stock', methods=['POST'])
def decrement_stock():
    data = request.get_json()
    product_id = data['product_id']
    decrement = data['decrement']
    requests.post('https://inventory-backend-327554758505.us-central1.run.app/decrement_stock', json={'product_id': product_id, 'decrement': decrement})
    return jsonify({'success': True})

@app.route('/order', methods=['POST'])
def order():
    data = request.get_json()
    product_id = data['product_id']
    # Send order value to orders-backend (root endpoint)
    requests.post('https://order-backend-327554758505.us-central1.run.app', json={
        'product_id': product_id,
        'value': 1
    })
    return jsonify({'success': True})

if __name__ == '__main__':
    app.run(debug=True, port=5000)