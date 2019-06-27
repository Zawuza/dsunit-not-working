CREATE TABLE languages(
  code CHAR(2) NOT NULL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE words(
  id NUMERIC NOT NULL PRIMARY KEY,
  language CHAR(2) NOT NULL REFERENCES languages,
  name TEXT UNIQUE NOT NULL
);

CREATE FUNCTION insert_language_trigger() 
  RETURNS TRIGGER
  LANGUAGE plpgsql AS
  $$
  BEGIN
    NEW.code := '11';
    RETURN NEW;
  END
  $$;

CREATE TRIGGER insert_language BEFORE INSERT 
  ON languages
  FOR EACH ROW
  EXECUTE PROCEDURE insert_language_trigger();

INSERT INTO languages(name) VALUES ('Russian');