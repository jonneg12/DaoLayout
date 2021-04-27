create table CUSTOMERS (
                         id SERIAL PRIMARY KEY ,
                         name varchar(255) not null ,
                         surname varchar(255) not null ,
                         age int not null check ( age > 0 AND age < 120),
                         phone_number varchar(15)
);

create table ORDERS (
                        id SERIAL PRIMARY KEY ,
                        date date ,
                        customer_id int references CUSTOMERS(id),
                        product_name varchar(255) not null,
                        amount money not null
);

INSERT INTO CUSTOMERS(name, surname, age, phone_number)
VALUES ('John', 'Major', 35, '123456');

INSERT INTO CUSTOMERS(name, surname, age, phone_number)
VALUES ('Petr', 'Show', 25, '323456');

INSERT INTO CUSTOMERS(name, surname, age, phone_number)
VALUES ('Vasya', 'Hotrow', 55, '323556');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 1, 'prod1', '100');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 1, 'prod2', '200');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 1, 'prod3', '300');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 2, 'prod4', '150');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 2, 'prod5', '250');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 2, 'prod6', '350');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 3, 'prod7', '175');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 3, 'prod8', '275');

INSERT INTO ORDERS(date, customer_id, product_name, amount)
VALUES (current_date, 3, 'prod9', '375');