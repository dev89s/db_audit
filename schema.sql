CREATE TABLE
  owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(20),
    age INT,
    PRIMARY KEY (id)
  );

CREATE TABLE
  species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20),
    PRIMARY KEY (id)
  );

CREATE TABLE
  animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species_id INT REFERENCES species (id),
    owner_id INT REFERENCES owners (id),
    PRIMARY KEY (id)
  );

CREATE TABLE
  vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
  );

CREATE TABLE
  specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    species_id INT REFERENCES species (id),
    vet_id INT REFERENCES vets (id),
    PRIMARY KEY (id)
  );

CREATE TABLE
  visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT REFERENCES animals (id),
    vet_id INT REFERENCES vets (id),
    date_of_visit DATE,
    PRIMARY KEY (id)
  );

ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- INDEXING FOR ANIMAL_ID ON VISITS TABLE

CREATE INDEX VISITS_ANIMAL_ID_ASC ON VISITS(ANIMAL_ID ASC);

-- INDEXING FOR VISIT_ID ON VISITS TABLE

CREATE INDEX vet_id_asc on visits(vet_id, id, animal_id, date_of_visit);

-- INDEXING EMAIL ON OWNERS TABLE

CREATE INDEX OWNERS_EMAIL_ASC ON OWNERS(EMAIL ASC);
