DROP TABLE IF EXISTS "address" CASCADE;
CREATE TABLE "address"(
    address_id SERIAL PRIMARY KEY,
    street	varchar(50)	NULL,
    city	varchar(50)	NULL,
    "state"	varchar(2)	NULL,
    zip	varchar(10)	NULL,
    country	varchar(50)	NULL
);

DROP TABLE IF EXISTS contact CASCADE;
CREATE TABLE contact(
    contact_id SERIAL PRIMARY KEY,
    phone	varchar(20)	NULL,
    cell	varchar(20)	NULL,
    email	varchar(100)	NULL,
    facebook	varchar(50)	NULL,
    twitter	varchar(50)	NULL,
    google	varchar(100) NULL
);

DROP TABLE IF EXISTS employee_role CASCADE;
CREATE TABLE employee_role(
    employee_role_ID	SERIAL	PRIMARY KEY,
    employee_role	varchar(50)	
);

DROP TABLE IF EXISTS employee CASCADE;
CREATE TABLE employee(
    employee_id SERIAL PRIMARY KEY,
    first_name varchar(50),
    last_name VARCHAR(50),
    address_id  INTEGER NOT NULL,
    contact_id INTEGER NOT NULL,
    employee_role_id INTEGER NOT NULL,
    FOREIGN KEY	(address_id) REFERENCES "address"(address_id) ON DELETE CASCADE,
    FOREIGN KEY	(contact_id) REFERENCES contact(contact_id) ON DELETE CASCADE,
    FOREIGN KEY	(employee_role_id) REFERENCES employee_role(employee_role_id) 
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name varchar(50),
    last_name VARCHAR(50),
    account_id INTEGER,
    address_id  INTEGER NOT NULL,
    contact_id INTEGER NOT NULL,
    FOREIGN KEY	(address_id) REFERENCES "address"(address_id) ON DELETE CASCADE,
    FOREIGN KEY	(contact_id) REFERENCES contact(contact_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS concession	CASCADE;	
CREATE TABLE concession	(	
    concession_id	SERIAL	PRIMARY KEY	,
    concession_name	varchar(50)		,
    concession_cost	numeric(4,2)		
);

DROP TABLE IF EXISTS  cart_concession CASCADE;			
CREATE TABLE  cart_concession(			
    cart_concession_id SERIAL PRIMARY KEY,		
    concession_id INTEGER NOT NULL,		
    number_purchased numeric(18,0),		
    FOREIGN KEY	(concession_id) REFERENCES concession(concession_id) 
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS cart CASCADE;			
CREATE TABLE  cart(
    cart_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    cart_concession_id INTEGER NOT NULL,
    cart_date timestamp with time zone DEFAULT timezone('utc', now()),
    FOREIGN KEY	(customer_id) REFERENCES customer(customer_id) 
    ON DELETE CASCADE,
    FOREIGN KEY	(employee_id) REFERENCES employee(employee_id) 
    ON DELETE CASCADE,
    FOREIGN KEY	(cart_concession_id) REFERENCES 
    cart_concession(cart_concession_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS  category	CASCADE;
CREATE TABLE  category(
    category_id	SERIAL	PRIMARY KEY,
    category_name	varchar(50)	
);

DROP TABLE IF EXISTS  movie_category CASCADE;			
CREATE TABLE  movie_category(			
    movie_category_id SERIAL PRIMARY KEY,		
    category_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    FOREIGN KEY	(category_id) REFERENCES category(category_id) ON DELETE CASCADE,
    FOREIGN KEY	(movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS rating	CASCADE;	
CREATE TABLE rating	(
    rating_id SERIAL PRIMARY KEY,
    rating	varchar(50)
);

DROP TABLE IF EXISTS movie CASCADE;			
CREATE TABLE  movie(
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    descrip TEXT,
    rating_id INTEGER NOT NULL,
    language_id VARCHAR(5),
    movie_length VARCHAR(50),
    movie_cost VARCHAR(50),
    FOREIGN KEY	(rating_id) REFERENCES rating(rating_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS  ticket CASCADE;			
CREATE TABLE  ticket(
    ticket_id SERIAL PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    FOREIGN KEY	(movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS  "order" CASCADE;
CREATE TABLE  "order"(
    order_id SERIAL PRIMARY KEY,
    ticket_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    order_date timestamp with time zone  DEFAULT timezone('utc', now()),
    FOREIGN KEY	(ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY	(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY	(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS  payment CASCADE;
CREATE TABLE  payment(
    payment_id SERIAL PRIMARY KEY,
    cart_id INTEGER NULL,
    order_id INTEGER NULL,
    employee_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    total_cost numeric(18,2),
    payment_time timestamp with time zone  DEFAULT timezone('utc', now()),
    FOREIGN KEY	(payment_id) REFERENCES payment(payment_id) ON DELETE CASCADE,
    FOREIGN KEY	(cart_id) REFERENCES cart(cart_id) ON DELETE CASCADE,
    FOREIGN KEY	(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY	(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);