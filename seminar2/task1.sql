CREATE DATABASE seminar2;

USE salessalesseminar2;

CREATE TABLE sales (
    id INT,
    order_date Date NOT NULL,
    bucket VARCHAR(50)
    );

INSERT INTO sales (id, order_date, bucket) VALUES (
    1, "2021-01-01", "101 to 300"
    );

INSERT INTO sales (id, order_date, bucket) VALUES (
    1, "2021-01-02", "101 to 300"
    );

INSERT INTO sales (id, order_date, bucket) VALUES (
    1, "2021-01-03", "less than equal to 100"
    );

INSERT INTO sales (id, order_date, bucket) VALUES (
    1, "2021-01-04", "101 to 300"
    );

INSERT INTO sales (id, order_date, bucket) VALUES (
    1, "2021-01-05", "greater than 300"
    );