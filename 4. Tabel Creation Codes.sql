create database olympic_games;
CREATE TABLE Equipment
(
  Item_id INT NOT NULL,
  Name_e VARCHAR(30) NOT NULL,
  Cost INT NOT NULL,
  number_of_equipment INT NOT NULL,
  PRIMARY KEY (Item_id)
);

CREATE TABLE Sponsors
(
  Name_s VARCHAR(30) NOT NULL,
  Sponsor_id INT NOT NULL,
  PRIMARY KEY (Sponsor_id)
);

CREATE TABLE Transport
(
  Vehicle_id VARCHAR(10) NOT NULL,
  Capacity INT NOT NULL,
  PRIMARY KEY (Vehicle_id)
);

CREATE TABLE Location
(
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  PRIMARY KEY (Name_L, Zip_code)
);

CREATE TABLE Arena
(
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  Capacity INT NOT NULL,
  PRIMARY KEY (Name_L, Zip_code),
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Location(Name_L, Zip_code)
);

CREATE TABLE Accommodation
(
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  PRIMARY KEY (Name_L, Zip_code),
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Location(Name_L, Zip_code)
);

CREATE TABLE Tickets
(
  Seat_Number INT NOT NULL,
  Ticket_number INT NOT NULL,
  date_t DATE NOT NULL,
  cost INT NOT NULL,
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  PRIMARY KEY (Ticket_number, date_t),
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Arena(Name_L, Zip_code)
);

CREATE TABLE Fixtures
(
  Match_id VARCHAR(10) NOT NULL,
  Name_sports VARCHAR(30) NOT NULL,
  Time_f VARCHAR(30) NOT NULL,
  Date_f DATE NOT NULL,
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  PRIMARY KEY (Match_id),
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Arena(Name_L, Zip_code)
);

CREATE TABLE Result
(
  Country VARCHAR(30) NOT NULL,
  Ranking INT NOT NULL,
  Match_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (Country, Match_id),
  FOREIGN KEY (Match_id) REFERENCES Fixtures(Match_id)
);

CREATE TABLE Sponsored_by
(
  Sponsor_id INT NOT NULL,
  Match_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (Sponsor_id) REFERENCES Sponsors(Sponsor_id),
  FOREIGN KEY (Match_id) REFERENCES Fixtures(Match_id)
);

CREATE TABLE Requires
(
  Item_id INT NOT NULL,
  Match_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (Item_id) REFERENCES Equipment(Item_id),
  FOREIGN KEY (Match_id) REFERENCES Fixtures(Match_id)
);

CREATE TABLE Person
(
  Name VARCHAR(30) NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  Gender VARCHAR(10),
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  PRIMARY KEY (Person_id),
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Accommodation(Name_L, Zip_code)
);

CREATE TABLE Official
(
  Medal_presenter CHAR(1) NOT NULL,
  Referee CHAR(1) NOT NULL,
  Judge CHAR(1) NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (Person_id),
  FOREIGN KEY (Person_id) REFERENCES Person(Person_id)
);

CREATE TABLE Athlete
(
  Country VARCHAR(30) NOT NULL,
  Sport VARCHAR(30) NOT NULL,
  JerseyNumber INT NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (Person_id),
  FOREIGN KEY (Person_id) REFERENCES Person(Person_id)
);

CREATE TABLE Participates_organises
(
  Match_id VARCHAR(10) NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (Match_id) REFERENCES Fixtures(Match_id),
  FOREIGN KEY (Person_id) REFERENCES Person(Person_id)
);

CREATE TABLE Travels_from
(
  Time_D VARCHAR(10) NOT NULL,
  Date_D DATE NOT NULL,
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  Vehicle_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Location(Name_L, Zip_code),
  FOREIGN KEY (Person_id) REFERENCES Person(Person_id),
  FOREIGN KEY (Vehicle_id) REFERENCES Transport(Vehicle_id)
);

CREATE TABLE Travels_to
(
  Time_A VARCHAR(10) NOT NULL,
  Date_A DATE NOT NULL,
  Name_L VARCHAR(30) NOT NULL,
  Zip_code INT NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  Vehicle_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (Name_L, Zip_code) REFERENCES Location(Name_L, Zip_code),
  FOREIGN KEY (Person_id) REFERENCES Person(Person_id),
  FOREIGN KEY (Vehicle_id) REFERENCES Transport(Vehicle_id)
);

CREATE TABLE Uses
(
  Vehicle_id VARCHAR(10) NOT NULL,
  Person_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (Vehicle_id) REFERENCES Transport(Vehicle_id),
  FOREIGN KEY (Person_id) REFERENCES Person(Person_id)
);
