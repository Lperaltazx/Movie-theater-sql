INSERT INTO "address"(street, city, "state", zip, country) VALUES
('saint nickols','new york','ny',10030,'United States'),
('1916 park ave','new york','ny',10037,'United States'),
('3555 netherland','new york','ny',10463,'United States'),
('324 70th st','guttenberg','nj',07093,'United States'),
('2621 palisade ave','new york','ny',10463,'United States'),
('3476 jerome','new york','ny',10467,'United States');

INSERT INTO contact(phone, cell, email) VALUES
('666-666-6666','123-456-1010','lupat@gmail,com'),
('925-647-9345','674-982-0437','lulu@gmail.com'),
('678-395-5745','763-016-8857','caycayug@gmail.com'),
('081-467-295','637-986-1400','itsus@gmail.com'),
('802-954-9989','683-081-1157','hdhi@gmail.com'),
('578-865-3357','825-974-9976','dholij@gmail.com');

INSERT INTO employee_role(employee_role) VALUES
('Theater Team Member'),
('Crew Leader'),
('Manager');

INSERT INTO employee(first_name, last_name, address_id, contact_id, 
employee_role_id) VALUES
('lulu','steves',1,1,1),
('luis','peralta',2,2,2),
('natilie','bass',3,3,3);

INSERT INTO customer(first_name, last_name, address_id, contact_id, account_id) 
VALUES
('james','franco',4,4,1),
('laura','diaz',5,5,2),
('tibo','bobum',6,6,3);

INSERT INTO concession(concession_name, concession_cost) VALUES
('Small Popcorn', 1.00),
('Medium Popcorn', 1.50),
('6 oz Drink', 4.00),
('8 oz Drink', 5.00);

INSERT INTO cart_concession(concession_id, number_purchased) VALUES
(3, 2),
(1,1),
(4,1);

INSERT INTO cart(customer_id, employee_id, cart_concession_id) VALUES
(1,1,1),
(2, 1, 2),
(3,2,3);

INSERT INTO category(category_name) VALUES
('Action'),
('Adventure'),
('Animation'),
('Comedy'),
('Crime'),
('Documentary'),
('Drama'),
('Fantasy'),
('Horror'),
('Romance'),
('Sci-Fi'),
('Thriller');

INSERT INTO rating(rating) VALUES
('G'),
('PG'),
('PG-13'),
('PG-17'),
('R');

INSERT INTO movie(title, descrip, rating_id, language_id, movie_length, 
movie_cost) VALUES
('hell boy', 'A demon, raised from infancy after being conjured by and rescued from the Nazis, grows up to become a defender against the forces of darkness.',
2, 'en', 106, 5.50),
('ww2', ' a global war that lasted from 1939 to 1945.',
4, 'fr', 175, 7.75),
('Star Wars', 'a man with dad issues finds his father but doesnt like the result.',
5, 'en', 84, 5.50),
('transformers', 'a bunch of robots',
1, 'en', 76, 5.50);

INSERT INTO movie_category(movie_id,category_id) VALUES
(1,4),
(1,8),
(2,7),
(2,10),
(3,9),
(4,3),
(4,2),
(4,8);

INSERT INTO ticket(movie_id) VALUES
(4),
(4),
(4),
(4),
(2),
(2),
(1),
(1),
(1);

INSERT INTO payment(cart_id, employee_id, customer_id, total_cost) VALUES
(1,1,1, 8.00),
(2,1,2, 1.00),
(3,2,3, 5.00);
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
