CREATE TABLE Food_stand
(
  id_of_stand INT NOT NULL,
  name_of_stand VARCHAR NOT NULL,
  location VARCHAR NOT NULL,
  PRIMARY KEY (id_of_stand)
);

CREATE TABLE food
(
  name_of_food VARCHAR(40) NOT NULL,
  price INT NOT NULL,
  amount_in_stock_ INT NOT NULL,
  expiry_date DATE NOT NULL,
  food_id INT NOT NULL,
  PRIMARY KEY (food_id)
);

CREATE TABLE visitors
(
  visitor_id INT NOT NULL,
  PRIMARY KEY (visitor_id)
);

CREATE TABLE food_in_stand
(
  id_of_stand INT NOT NULL,
  name_of_food INT NOT NULL,
  PRIMARY KEY (id_of_stand, name_of_food),
  FOREIGN KEY (id_of_stand) REFERENCES Food_stand(id_of_stand),
  FOREIGN KEY (name_of_food) REFERENCES food(name_of_food)
);

CREATE TABLE buyer_in_food_stand
(
  id_of_stand INT NOT NULL,
  visitor_id INT NOT NULL,
  PRIMARY KEY (id_of_stand, visitor_id),
  FOREIGN KEY (id_of_stand) REFERENCES Food_stand(id_of_stand),
  FOREIGN KEY (visitor_id) REFERENCES visitors(visitor_id)
);

CREATE TABLE Lost_and_founds_department
(
  id_of_lost_item INT NOT NULL,
  type_of_item VARCHAR NOT NULL,
  discovery_time DATE NOT NULL,
  return_time DATE NOT NULL,
  last_announcement_time DATE NOT NULL,
  degree_of_importance INT NOT NULL,
  visitor_id INT NOT NULL,
  PRIMARY KEY (id_of_lost_item),
  FOREIGN KEY (visitor_id) REFERENCES visitors(visitor_id)
);

CREATE TABLE workers
(
  worker_id INT NOT NULL,
  id_of_stand INT NOT NULL,
  id_of_lost_item INT NOT NULL,
  PRIMARY KEY (worker_id),
  FOREIGN KEY (id_of_stand) REFERENCES Food_stand(id_of_stand),
  FOREIGN KEY (id_of_lost_item) REFERENCES Lost_and_founds_department(id_of_lost_item)
);
