CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "cards" ("idf" varchar, "durata" varchar, "categoria" varchar, "zona" varchar, "energia" integer, "esercizi" text, "impiegato_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_c4f625b97e"
FOREIGN KEY ("impiegato_id")
  REFERENCES "impiegatos" ("id")
);
CREATE INDEX "index_cards_on_impiegato_id" ON "cards" ("impiegato_id");
INSERT INTO "schema_migrations" (version) VALUES
('20200526055122');


