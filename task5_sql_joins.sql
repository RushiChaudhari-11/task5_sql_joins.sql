-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Customers
INSERT INTO Customers (customer_id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

-- Insert data into Orders
INSERT INTO Orders (order_id, customer_id, product) VALUES
(1, 1, 'Book'),
(2, 2, 'Pen'),
(3, 1, 'Notebook'),
(4, 5, 'Bag'); -- No matching customer

-- 1. INNER JOIN: Only matching records
SELECT C.customer_id, C.name, O.product
FROM Customers C
INNER JOIN Orders O ON C.customer_id = O.customer_id;

-- 2. LEFT JOIN: All customers + their orders (if any)
SELECT C.customer_id, C.name, O.product
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id;

-- 3. RIGHT JOIN: All orders + customer info (if any)
SELECT C.customer_id, C.name, O.product
FROM Customers C
RIGHT JOIN Orders O ON C.customer_id = O.customer_id;

-- 4. FULL OUTER JOIN (supported via UNION in MySQL)
SELECT C.customer_id, C.name, O.product
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id

UNION

SELECT C.customer_id, C.name, O.product
FROM Customers C
RIGHT JOIN Orders O ON C.customer_id = O.customer_id;
