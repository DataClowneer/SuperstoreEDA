CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE customers (
  CustomerID VARCHAR(50) PRIMARY KEY,
  CustomerName VARCHAR(100),
  Segment VARCHAR(50),
  CustomerIDNo VARCHAR(50)
);

USE superstore_db;
CREATE TABLE IF NOT EXISTS products (
    ProductID VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    ProductIDNo INT(50)
);


CREATE TABLE orders (
  OrderID VARCHAR(50),
  OrderDate DATE,
  ShipDate DATE,
  ShipMode VARCHAR(50),
  CustomerID VARCHAR(50),
  ProductID VARCHAR(50),
  Sales DECIMAL(10,2),
  Quantity INT,
  Discount DECIMAL(4,2),
  Profit DECIMAL(10,2),
  OrderIDNo VARCHAR(50),
  PRIMARY KEY (OrderID, ProductID),
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);
