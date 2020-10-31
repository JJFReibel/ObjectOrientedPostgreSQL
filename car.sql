/*
MIT License

Copyright (c) 2020 Jean-Jacques François Reibel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
Implement Database as a module and table to be used as a class.
Implement stored procedures to be used as functions.
This syntax works for PostgreSQL.
*/

/* Create database, table, settings, and instance of a car. */
CREATE DATABASE Vehicles;
/*
Note how wheels, doors, and cylinders are of type INT.
In MySQL and SQLite, among others, they can be VARCHAR(255).
Not in PostgreSQL, in order for the procedures to work and do math.
*/
CREATE TABLE Car(
carId SERIAL PRIMARY KEY,
carName varchar(255),
wheels INT,
doors INT,
cylinders INT);

INSERT INTO Car (carName, wheels, doors, cylinders)
VALUES ('subaru', 4, 4, 4);

/* Implement stored procedures. */
/* Set functions. */
CREATE PROCEDURE setWheels(myCar character varying, wheelsIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET wheels = wheelsIn WHERE carName = myCar;
  $$;

CREATE PROCEDURE setDoors(myCar character varying, doorsIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET doors = doorsIn WHERE carName = myCar;
  $$;

CREATE PROCEDURE setCylinders(myCar character varying, cylindersIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET cylinders = cylindersIn WHERE carName = myCar;
  $$;

/* Add functions. */
CREATE PROCEDURE addWheels(myCar character varying, wheelsIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET wheels = wheels + wheelsIn WHERE carName = myCar;
  $$;

CREATE PROCEDURE addDoors(myCar character varying, doorsIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET doors = doors + doorsIn WHERE carName = myCar;
  $$;

CREATE PROCEDURE addCylinders(myCar character varying, cylindersIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET cylinders = cylinders + cylindersIn WHERE carName = myCar;
  $$;

/* Subtract functions. */
CREATE PROCEDURE deleteWheels(myCar character varying, wheelsIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET wheels = (wheels - wheelsIn) WHERE carName = myCar;
  $$;

CREATE PROCEDURE deleteDoors(myCar character varying, doorsIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET doors = doors - doorsIn WHERE carName = myCar;
  $$;

CREATE PROCEDURE deleteCylinders(myCar character varying, cylindersIn integer)
  LANGUAGE SQL
  AS $$
  	UPDATE Car SET cylinders = cylinders - cylindersIn WHERE carName = myCar;
  $$;

/* Call procedures. */
CALL setWheels('subaru', 5);
CALL deleteWheels('subaru', 1);
