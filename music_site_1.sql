CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL 
);

CREATE TABLE IF NOT EXISTS Author (
	id SERIAL PRIMARY KEY,
	name_author_or_alias TEXT NOT NULL 
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name_album TEXT NOT NULL,
	date_of_issue date NOT NULL CHECK (date_of_issue > 1995)
);

CREATE TABLE IF NOT EXISTS Trek (
	id SERIAL PRIMARY KEY,
	album_id integer REFERENCES Album(id),
	name_trek TEXT, 
	duration_trek integer CHECK (duration_trek < 180)
);

CREATE TABLE IF NOT EXISTS GenresAuthor (
	genres_id INTEGER REFERENCES Genres(id),
	author_id INTEGER REFERENCES Author(id),
	CONSTRAINT ga PRIMARY KEY (genres_id, author_id)
);

CREATE TABLE IF NOT EXISTS AuthorAlbum (
	author_id INTEGER REFERENCES Author(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT aa PRIMARY KEY (author_id, album_id)
);

CREATE TABLE IF NOT EXISTS Collection(
	id serial PRIMARY KEY,
	name_collection TEXT NOT NULL,
	year_of_issue date NOT NULL,
	trek_id integer NOT NULL REFERENCES Trek(id)
);

CREATE TABLE IF NOT EXISTS TrekCollection(
	trek_id INTEGER REFERENCES Trek(id),
	collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT tc PRIMARY KEY (trek_id, collection_id)
);

DROP TABLE IF EXISTS albumtrek 