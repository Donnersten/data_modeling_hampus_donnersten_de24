SET search_path TO ezecream_05;

INSERT INTO Customer (first_name, last_name, email, adress)
VALUES
    (
        'Ragnar',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    ),
    (
        'Lagertha',
        'Lothbrok',
        'lagertha@kattegat.com',
        '2 Shieldmaiden Road'
    ),
    (
        'Bjorn',
        'Ironside',
        'bjorn@kattegat.com',
        '3 Viking Bay'
    ),
    (
        'Ivar',
        'the Boneless',
        'ivar@danes.com',
        '4 The Great Heathen Army Camp'
    );

INSERT INTO ezecream_05.Customer (customer_id,first_name, last_name, email, adress)
VALUES
    (
        50,
        'Olof',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    );

-- TO DO reader How to delete a row. Customer_id 50

SELECT * FROM ezecream_05.customer;