from flask import Flask, render_template, request, jsonify
import requests

app = Flask(__name__)

# Use API Gateway 
API_GATEWAY_URL = 'https://shopsphere-gateway-46h5n97t.uc.gateway.dev'

@app.route('/')
def home():
    response = requests.get(f'{API_GATEWAY_URL}/products')
    products = response.json()
    return render_template('index.html', products=products)

@app.route('/decrement_stock', methods=['POST'])
def decrement_stock():
    data = request.get_json()
    product_id = data['product_id']
    decrement = data['decrement']
    requests.post(f'{API_GATEWAY_URL}/inventory/decrement', json={
        'product_id': product_id,
        'decrement': decrement
    })
    return jsonify({'success': True})

@app.route('/order', methods=['POST'])
def order():
    data = request.get_json()
    product_id = data['product_id']
    name = data.get('name')
    price = data.get('price')
    # Send order value, name, and price to orders-backend (root endpoint)
    requests.post(f'{API_GATEWAY_URL}/orders', json={
        'product_id': product_id,
        'name': name,
        'price': price,
        'value': 1
    })
    return jsonify({'success': True})

#test

if __name__ == '__main__':
    app.run(debug=True, port=5000)
