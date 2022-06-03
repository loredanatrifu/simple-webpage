
create table "heroes" (
	id serial not null,
	hero_name varchar (20),
	constraint hero_pkey primary key (id)
);

insert into heroes (hero_name) values
	('Captain America'),
	('Iron Man'),
	('Thor'),
	('Hulk'),
	('Black Widow'),
	('Hawkeye');

create table "description" (
	id serial primary key,
	strengths varchar (50) not null,
	date_of_birth date not null,
	eyes_color varchar (10) not null,
	height varchar (10) not null,
	greatest_enemies varchar (100) not null,
	image varchar (100) not null,
	heroes_id int,
	foreign key (heroes_id) references heroes(id)
);

insert into description(strengths,date_of_birth,eyes_color,height, greatest_enemies, image, heroes_id) values
	('agility, strength, speed', '1918/07/04', 'blue', '188 cm', 'Adolf Hitler, Red Skull, Baron Zemo', 'captain-america.jpg', 1),
	('ingenious scientist, business magnate, inventor', '1970/05/25', 'brown','185 cm','Mandarin, Obadiah Stane, Justin Hammer', 'iron-man.jpg', 2),
	('his hammer', '0001/01/01', 'blue', '190 cm','Galactus, Mangog, Surtur', 'thor.jpg', 3),
	('power increase as his anger grows', '1969/12/18', 'brown', '243 cm','The Leader, Abomination, General Thaddeus "Thunderbolt"', 'hulk.jpg', 4),
	('master in infiltration, espionage', '1984/12/03', 'blue', '164 cm','Yelena Belova, Alexi Shostakov, Madame Hydra', 'black-widow.jpg', 5),
	('fencer, acrobat and marksman', '1971/06/18', 'brown', '173 cm', 'Crossfire, Swordsman, Baron Helmut Zemo','hawkeye.jpg', 6);


insert into description(strengths,date_of_birth,eyes_color,height, greatest_enemies, image, heroes_id) values
	('agility, strength, speed', '1918/07/04', 'blue', '188 cm', 'Adolf Hitler, Red Skull, Baron Zemo', bytea('/static/images/captain-america.jpg'), 1),
	('ingenious scientist, business magnate, inventor', '1970/05/25', 'brown','185 cm','Mandarin, Obadiah Stane, Justin Hammer', bytea('/static/images/iron-man.jpg'), 2),
	('his hammer', '0001/01/01', 'blue', '190 cm','Galactus, Mangog, Surtur', bytea('/static/images/thor.jpg'), 3),
	('power increase as his anger grows', '1969/12/18', 'brown', '243 cm','The Leader, Abomination, General Thaddeus "Thunderbolt"', bytea('/static/images/hulk.jpg'), 4),
	('master in infiltration, espionage', '1984/12/03', 'blue', '164 cm','Yelena Belova, Alexi Shostakov, Madame Hydra', bytea('/static/images/black-widow.jpg'), 5),
	('fencer, acrobat and marksman', '1971/06/18', 'brown', '173 cm', 'Crossfire, Swordsman, Baron Helmut Zemo',bytea('/static/images/hawkeye,jpg'), 6);

