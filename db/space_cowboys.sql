DROP TABLE bounty_hunters;

CREATE TABLE bounty_hunters (

id SERIAL PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
species VARCHAR(255),
homeworld VARCHAR(255),
cash_in INT

);
