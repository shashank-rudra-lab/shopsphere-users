# SQL setup script for the development environment
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    item_name VARCHAR(255),
    quantity INT,
    order_date DATE
);

INSERT INTO orders (customer_name, item_name, quantity, order_date)
VALUES ('Dev Customer', 'Dev Item', 1, CURRENT_DATE);
