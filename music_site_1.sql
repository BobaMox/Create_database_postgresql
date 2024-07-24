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
	date_of_issue date NOT NULL 
);

CREATE TABLE IF NOT EXISTS Trek (
	id INTEGER PRIMARY KEY REFERENCES Album(id),
	name_trek TEXT, 
	duration_trek integer 
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

DROP TABLE IF EXISTS albumtrek 
