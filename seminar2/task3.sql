CREATE TABLE orders (
    ordreid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(3) NOT NULL,
    amount DECIMAL(5,2) NOT NULL,
    orderstatus VARCHAR(10) NOT NULL
    );

INSERT INTO orders (employeeid, amount, orderstatus) VALUES (
    "e03", 15.00, "OPEN");

INSERT INTO orders (employeeid, amount, orderstatus) VALUES (
    "e01", 25.50, "OPEN");

INSERT INTO orders (employeeid, amount, orderstatus) VALUES (
    "e05", 100.70, "CLOSED");

INSERT INTO orders (employeeid, amount, orderstatus) VALUES (
    "e02", 22.18, "OPEN");

INSERT INTO orders (employeeid, amount, orderstatus) VALUES (
    "e04", 9.50, "CANCELLED");

INSERT INTO orders (employeeid, amount, orderstatus) VALUES (
    "e04", 99.99, "OPEN");
    
SELECT ordreid, orderstatus,
    CASE
    WHEN orderstatus = "OPEN"
    THEN "Order is in open state."
    WHEN orderstatus = "CLOSED"
    THEN "Order is closed."
    ELSE "Order is cancelled."
    END AS order_summary
    FROM orders;