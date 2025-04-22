CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    date_of_birth DATE,
    contact INT,
    role VARCHAR(20)
);

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price FLOAT(10, 2)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_type VARCHAR(50),
    payment_amount FLOAT(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
