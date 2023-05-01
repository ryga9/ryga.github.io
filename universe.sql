-- Step 1: Create database
CREATE DATABASE universe;

-- Step 2: Connect to the database
\c universe

-- Step 3: Create tables
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    age INT NOT NULL,
    size NUMERIC NOT NULL,
    is_visible BOOLEAN
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL,
    age INT NOT NULL,
    is_visible BOOLEAN,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT NOT NULL,
    radius INT,
    is_habitable BOOLEAN,
    description TEXT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT NOT NULL,
    radius INT,
    is_habitable BOOLEAN,
    description TEXT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

-- Step 4: Add rows
-- Note: You should provide your own data to insert into these tables.
-- These are just example inserts to show the syntax

INSERT INTO galaxy (name, age, size, is_visible) VALUES 
('Milky Way', 13700, 1.5, true),
('Andromeda', 10000, 2.537, true),
('Triangulum', 3000, 0.6, false),
('Centaurus A', 13000, 2.3, true),
('Whirlpool', 23700, 0.76, false),
('Pinwheel', 21000, 1.704, true);

INSERT INTO star (name, galaxy_id, age, is_visible) VALUES 
('Sun', 1, 4600, true),
('Sirius', 1, 200, true),
('Vega', 2, 455, true),
('Rigel', 3, 8000, false),
('Betelgeuse', 3, 8400, true),
('Canopus', 4, 10000, true);

-- Continue inserting data into planet and moon tables
-- Inserting data into planet table
INSERT INTO planet (name, star_id, radius, is_habitable, description) VALUES 
('Earth', 1, 6371, true, 'Home planet'),
('Mars', 1, 3389, false, 'The Red Planet'),
('Venus', 1, 6051, false, 'Second planet from the Sun'),
('Jupiter', 1, 69911, false, 'Largest planet in the Solar System'),
('Saturn', 1, 58232, false, 'Gas giant with an iconic ring system'),
('Uranus', 1, 25362, false, 'Ice giant'),
('Neptune', 1, 24622, false, 'Farthest planet from the Sun'),
('Mercury', 1, 2440, false, 'Closest planet to the Sun'),
('Kepler-22b', 2, 20473, true, 'First planet in habitable zone of a star'),
('Proxima Centauri b', 3, 6907, true, 'Closest exoplanet to the Sun'),
('Gliese 667 Cc', 3, 12850, true, 'Potential super Earth'),
('Tau Ceti e', 4, 16303, false, 'Potential habitable exoplanet');

-- Inserting data into moon table
INSERT INTO moon (name, planet_id, radius, is_habitable, description) VALUES 
('Moon', 1, 1737, false, 'Earth\'s moon'),
('Phobos', 2, 11, false, 'Larger moon of Mars'),
('Deimos', 2, 6, false, 'Smaller moon of Mars'),
('Io', 4, 1822, false, 'One of Jupiter\'s largest moons'),
('Europa', 4, 1561, true, 'Ice-covered moon of Jupiter'),
('Ganymede', 4, 2634, false, 'Largest moon of Jupiter'),
('Callisto', 4, 2410, false, 'Outermost of Jupiter\'s four large moons'),
('Titan', 5, 2575, false, 'Largest moon of Saturn'),
('Rhea', 5, 764, false, 'Second-largest moon of Saturn'),
('Iapetus', 5, 734, false, 'Third-largest moon of Saturn'),
('Dione', 5, 562, false, 'Fourth-largest moon of Saturn'),
('Tethys', 5, 531, false, 'Fifth-largest moon of Saturn'),
('Enceladus', 5, 252, false, 'Sixth-largest moon of Saturn'),
('Mimas', 5, 198, false, 'Seventh-largest moon of Saturn'),
('Miranda', 6, 236, false, 'One of Uranus\'s major moons'),
('Ariel', 6, 578, false, 'Brightest moon of Uranus'),
('Umbriel', 6, 585, false, 'Dark moon of Uranus'),
('Titania', 6, 788, false, 'Largest moon of Uranus'),
('Oberon', 6, 761, false, 'Second-largest moon of Uranus'),
('Triton', 7, 1353, false, 'Largest moon of Neptune');

INSERT INTO comet (name, galaxy_id, is_visible, speed, has_tail) VALUES 
('Halley', 1, true, 54, true),
('Hale-Bopp', 1, false, 45, true),
('Borrelly', 2, true, 25, false);
