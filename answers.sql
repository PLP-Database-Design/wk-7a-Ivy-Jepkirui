/*SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order*/

SELECT 
    OrderID,
    CustomerName,
    TRIM(product) AS Product
FROM 
    ProductDetail,
    UNNEST(STRING_TO_ARRAY(Products, ',')) AS product;


/*SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.
step one*/

CREATE TABLE Orders AS
SELECT DISTINCT 
    OrderID,
    CustomerName
FROM 
    OrderDetails;

/*step 2*/

CREATE TABLE OrderItems AS
SELECT 
    OrderID,
    Product,
    Quantity
FROM 
    OrderDetails;


