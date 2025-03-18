# 0. Ezecream orders
| order_id | order_date | customer_id | customer_name  | customer_address | product_id | product_name | quantity |
| -------- | ---------- | ----------- | -------------- | ---------------- | ---------- | ------------ | -------- |
| 101      | 2024-04-05 | 05          | Ragnar Lodbrok | Kattegatt 3      | 3          | Blåbärsmagi  | 20       |
| 101      | 2024-04-05 | 05          | Ragnar Lodbrok | Kattegatt 3      | 5          | Lakritsdröm  | 15       |
| 101      | 2024-04-05 | 05          | Ragnar Lodbrok | Kattegatt 3      | 1          | Lichipichi   | 35       |
| 105      | 2025-01-10 | 15          | Feliz Fernadu  | Madridugatan 2   | 8          | Gitlass      | 30       |
| ...      | ...        | ...         | ...            | ...              | ...        | ...          | ...      |

a) Find different problems with this table, so that Ezecream will take you in for internship to fix it for them

    - Allt är i samma table.
    - Saknas pris
    - Duplicerad data (Rangnar)

b1) Does this table satisfy 1NF, 2NF? Motivate.

    - Följer 1NF men följer inte 2NF.
    - Primery key måste bero på allt i tablet och i detta fall gör det inte det. 

b2) Normalize this table to 3NF, make conceptual diagram and relational schema notation for each relation. Relational schema notation is RelationName(attribute1, attribute2, ...)

    Customer
    | customer_id | name          | adress      |
    | ----------- | ------------- |-------------|
    | 1           | Bob Bobsson   | stenvägen 5 |
    | 2           | Sven Svensson | Grusvägen 4 |

    Order
    | order_id | order_date | customer_id |
    | -------- |----------- | ----------- |
    | 1        | 2023-10-31 | 1           |
    | 2        | 2023-10-31 | 1           |
    | 3        | 2025-03-10 | 2           |

    Orderline
    | order_id | product_id | quantety |
    | -------- |----------- | -------- |
    | 1        | 2          | 95       |
    | 2        | 1          | 20       |
    | 3        | 3          | 50       |
    
    Product         
    | product_id  | product_name   |
    | ----------- | -------------- |
    | 1           | Vaniljglass    |
    | 2           | Jordgubbsglass | 
    | 3           | Blåbärsglass   | 

c) Now also add price attribute. Think about what would happen when price increases or decreases.

        Om Price läggs till som en attredute så kommer priset ändra alla tidigare ordrar till det nya priset. Då måste man lägga till en ny Entety

d) Write SQL code to get the total price for Ragnar Lodbrok. Insert data into your tables and test it out.
