-- Solution for Q1: Create table with column names in E to G taking data from I, J & K column.

CREATE TABLE Invoice (
    Invoice_ID INT,
    Customer_ID INT,
    Product_Name VARCHAR(255)
);

INSERT INTO Invoice (Invoice_ID, Customer_ID, Product_Name)
SELECT I, J, K
FROM (
    VALUES
    (1111, 1, 'qq'),
    (1112, 1, 'ww'),
    (1113, 10, 'pp'),
    (1114, 2, 'lld'),
    (1115, 2, 'lkd'),
    (1116, 3, 'asas'),
    (1117, 9, 'wef'),
    (1118, 1, 'voxh')
) AS SourceData(I, J, K);



-- Solution for Q2: Write a query to find out list of customers present in CUSTOMER1 table which are not present in CUSTOMER2 table (DON'T USE IN or NOT IN).

-- Create CUSTOMER1 table (for demonstration purposes)

CREATE TABLE CUSTOMER1 (
    Customer_ID INT,
    Customer_Name VARCHAR(255)
);

INSERT INTO CUSTOMER1 (Customer_ID, Customer_Name) VALUES
(1, 'aa'),
(2, 'bb'),
(3, 'cc'),
(4, 'ff'),
(5, 'ee');

-- CUSTOMER2 table (for demonstration purposes)

CREATE TABLE CUSTOMER2 (
    Customer_ID INT,
    Customer_Name VARCHAR(255)
);

INSERT INTO CUSTOMER2 (Customer_ID, Customer_Name) VALUES
(1, 'aa'),
(4, 'ff'),
(5, 'ee');


-- Now, the query to find customers in CUSTOMER1 not present in CUSTOMER2 without using IN or NOT IN.

SELECT
    c1.Customer_ID,
    c1.Customer_Name
FROM
    CUSTOMER1 c1
LEFT JOIN
    CUSTOMER2 c2 ON c1.Customer_ID = c2.Customer_ID
WHERE
    c2.Customer_ID IS NULL;