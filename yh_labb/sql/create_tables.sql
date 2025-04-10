create schema if not exists yrkesco;

set search_path to yrkesco;

CREATE table if not exists "skola" (
  "skol_id" SERIAL PRIMARY KEY,
  "adress_id" integer NOT NULL,
  "skolnamn" VARCHAR(50) NOT NULL
);

CREATE table if not exists "adress" (
  "adress_id" SERIAL PRIMARY KEY,
  "stad_id" integer NOT NULL,
  "gatuadress" varchar(100) NOT NULL,
  "postnummer" varchar(6) NOT NULL
);
CREATE table if not exists "stad" (
  "stad_id" SERIAL PRIMARY KEY,
  "stad" VARCHAR(50) NOT NULL
);

CREATE table if not exists "student" (
  "student_id" serial PRIMARY KEY,
  "pu_id" INTEGER NOT NULL,
  "skol_id" integer NOT NULL,
  "förnamn" varchar(50) NOT NULL,
  "efternamn" varchar(100) NOT NULL,
  "epost" varchar(255) NOT NULL,
  "telefon" varchar(15) NOT NULL
);

CREATE table if not exists "fristående_kurs" (
  "fk_id" serial PRIMARY KEY,
  "skol_id" integer,
  "kurskod" varchar,
  "personal_id" integer
);

CREATE table if not exists "fristående_student" (
  "fk_id" integer NOT NULL,
  "student_id" INTEGER,
  PRIMARY KEY ("fk_id", "student_id")
);

CREATE table if not exists "klass" (
  "klass_id" Serial PRIMARY KEY,
  "bo_id" integer NOT NULL,
  "personal_id" integer NOT NULL,
  "skol_id" integer NOT NULL
);

CREATE table if not exists "antagen_student" (
  "klass_id" integer NOT NULL,
  "student_id" integer NOT NULL,
  PRIMARY KEY ("klass_id", "student_id")
);

CREATE table if not exists "person_uppgifter" (
  "adress_id" integer NOT NULL,
  "pu_id" SERIAL PRIMARY KEY,
  "personnummer" char(12) NOT NULL
);

CREATE table if not exists "beviljade_omgångar" (
  "bo_id" serial PRIMARY KEY,
  "program_id" varchar(10) NOT NULL,
  "år" varchar(2) NOT NULL
);

CREATE table if not exists "program" (
  "program_id" varchar(10) PRIMARY KEY,
  "programnamn" VARCHAR(50) NOT NULL
);

CREATE table if not exists "skolprogram" (
  "skol_id" INTEGER NOT NULL,
  "program_id" varchar(10) NOT NULL,
  PRIMARY KEY ("skol_id", "program_id")
);

CREATE table if not exists "kursprogram" (
  "kurskod" varchar NOT NULL,
  "program_id" varchar(10) NOT NULL,
  PRIMARY KEY ("kurskod", "program_id")
);

CREATE table if not exists "kurs" (
  "kurskod" varchar(10) PRIMARY KEY,
  "kursnamn" VARCHAR(50) NOT NULL,
  "poäng" integer NOT NULL,
  "beskrivning" varchar(255)
);

CREATE table if not exists "kursbetyg" (
  "student_id" INTEGER NOT NULL,
  "kurskod" varchar NOT NULL,
  "betyg" varchar(3) NOT NULL,
  PRIMARY KEY ("student_id", "kurskod")
);

CREATE table if not exists "ledningsgrupp" (
  "ledningsgrupp_id" SERIAL PRIMARY KEY,
  "program_id" varchar(10) NOT NULL,
  "skol_id" integer NOT NULL
);

CREATE table if not exists "ledningsföretag" (
  "ledningsgrupp_id" integer NOT NULL,
  "företag_org_nummer" varchar(11) NOT NULL,
  PRIMARY KEY ("ledningsgrupp_id", "företag_org_nummer")
);

CREATE table if not exists "ledningstudent" (
  "ledningsgrupp_id" integer NOT NULL,
  "student_id" INTEGER NOT NULL,
  PRIMARY KEY ("ledningsgrupp_id", "student_id")
);

CREATE table if not exists "protokoll" (
  "ledningsgrupp_id" integer NOT NULL,
  "protokoll_id" serial PRIMARY KEY,
  "protokoll" varchar(100000) NOT NULL,
  "datum" date NOT NULL
);

CREATE table if not exists "ledningspersonal" (
  "ledningsgrupp_id" integer NOT NULL,
  "personal_id" INTEGER NOT NULL,
  PRIMARY KEY ("ledningsgrupp_id", "personal_id")
);

CREATE table if not exists "företag" (
  "företag_org_nummer" varchar(11) PRIMARY KEY,
  "företag_namn" varchar(100) NOT NULL,
  "representant" varchar(50) NOT NULL,
  "epost" varchar(255) NOT NULL,
  "telefon" varchar(15) NOT NULL
);

CREATE table if not exists "personal" (
  "personal_id" serial PRIMARY KEY,
  "yrkes_id" integer NOT NULL,
  "förnamn" varchar(50) NOT NULL,
  "efternamn" varchar(100) NOT NULL,
  "epost" varchar(255) NOT NULL,
  "telefon" varchar(15) NOT NULL
);

CREATE table if not exists "kurstillfälle" (
  "personal_id" integer NOT NULL,
  "kurskod" varchar NOT NULL,
  PRIMARY KEY ("personal_id", "kurskod")
);

CREATE table if not exists "skolpersonal" (
  "personal_id" integer NOT NULL,
  "skol_id" integer NOT NULL,
  PRIMARY KEY ("personal_id", "skol_id")
);

CREATE table if not exists "yrkesroll" (
  "yrkes_id" SERIAL PRIMARY KEY,
  "titel" VARCHAR(50) NOT NULL
);

CREATE table if not exists "konsult" (
  "konsult_org_nummer" varchar(11) NOT NULL,
  "personal_id" integer NOT NULL,
  "timpris" float NOT NULL,
  PRIMARY KEY ("konsult_org_nummer", "personal_id")
);

CREATE table if not exists "konsultbolag" (
  "konsult_org_nummer" varchar(11) PRIMARY KEY,
  "adress_id" integer NOT NULL,
  "bolagsnamn" varchar(100) NOT NULL,
  "f_skatt" bool NOT NULL
);

CREATE table if not exists "fastanställda" (
  "pu_id" INTEGER NOT NULL,
  "personal_id" integer NOT NULL,
  PRIMARY KEY ("pu_id", "personal_id")
);

ALTER TABLE "skola" ADD FOREIGN KEY ("adress_id") REFERENCES "adress" ("adress_id");
ALTER TABLE "adress" ADD FOREIGN KEY ("stad_id") REFERENCES "stad" ("stad_id");
ALTER TABLE "student" ADD FOREIGN KEY ("pu_id") REFERENCES "person_uppgifter" ("pu_id");
ALTER TABLE "student" ADD FOREIGN KEY ("skol_id") REFERENCES "skola" ("skol_id");
ALTER TABLE "fristående_kurs" ADD FOREIGN KEY ("skol_id") REFERENCES "skola" ("skol_id");
ALTER TABLE "fristående_kurs" ADD FOREIGN KEY ("kurskod") REFERENCES "kurs" ("kurskod");
ALTER TABLE "fristående_kurs" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
ALTER TABLE "fristående_student" ADD FOREIGN KEY ("fk_id") REFERENCES "fristående_kurs" ("fk_id");
ALTER TABLE "fristående_student" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");
ALTER TABLE "klass" ADD FOREIGN KEY ("bo_id") REFERENCES "beviljade_omgångar" ("bo_id");
ALTER TABLE "klass" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
ALTER TABLE "klass" ADD FOREIGN KEY ("skol_id") REFERENCES "skola" ("skol_id");
ALTER TABLE "antagen_student" ADD FOREIGN KEY ("klass_id") REFERENCES "klass" ("klass_id");
ALTER TABLE "antagen_student" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");
ALTER TABLE "person_uppgifter" ADD FOREIGN KEY ("adress_id") REFERENCES "adress" ("adress_id");
ALTER TABLE "beviljade_omgångar" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id");
ALTER TABLE "skolprogram" ADD FOREIGN KEY ("skol_id") REFERENCES "skola" ("skol_id");
ALTER TABLE "skolprogram" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id");
ALTER TABLE "kursprogram" ADD FOREIGN KEY ("kurskod") REFERENCES "kurs" ("kurskod");
ALTER TABLE "kursprogram" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id");
ALTER TABLE "kursbetyg" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");
ALTER TABLE "kursbetyg" ADD FOREIGN KEY ("kurskod") REFERENCES "kurs" ("kurskod");
ALTER TABLE "ledningsgrupp" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id");
ALTER TABLE "ledningsgrupp" ADD FOREIGN KEY ("skol_id") REFERENCES "skola" ("skol_id");
ALTER TABLE "ledningsföretag" ADD FOREIGN KEY ("ledningsgrupp_id") REFERENCES "ledningsgrupp" ("ledningsgrupp_id");
ALTER TABLE "ledningsföretag" ADD FOREIGN KEY ("företag_org_nummer") REFERENCES "företag" ("företag_org_nummer");
ALTER TABLE "ledningstudent" ADD FOREIGN KEY ("ledningsgrupp_id") REFERENCES "ledningsgrupp" ("ledningsgrupp_id");
ALTER TABLE "ledningstudent" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");
ALTER TABLE "protokoll" ADD FOREIGN KEY ("ledningsgrupp_id") REFERENCES "ledningsgrupp" ("ledningsgrupp_id");
ALTER TABLE "ledningspersonal" ADD FOREIGN KEY ("ledningsgrupp_id") REFERENCES "ledningsgrupp" ("ledningsgrupp_id");
ALTER TABLE "ledningspersonal" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
ALTER TABLE "personal" ADD FOREIGN KEY ("yrkes_id") REFERENCES "yrkesroll" ("yrkes_id");
ALTER TABLE "kurstillfälle" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
ALTER TABLE "kurstillfälle" ADD FOREIGN KEY ("kurskod") REFERENCES "kurs" ("kurskod");
ALTER TABLE "skolpersonal" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
ALTER TABLE "skolpersonal" ADD FOREIGN KEY ("skol_id") REFERENCES "skola" ("skol_id");
ALTER TABLE "konsult" ADD FOREIGN KEY ("konsult_org_nummer") REFERENCES "konsultbolag" ("konsult_org_nummer");
ALTER TABLE "konsult" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
ALTER TABLE "konsultbolag" ADD FOREIGN KEY ("adress_id") REFERENCES "adress" ("adress_id");
ALTER TABLE "fastanställda" ADD FOREIGN KEY ("pu_id") REFERENCES "person_uppgifter" ("pu_id");
ALTER TABLE "fastanställda" ADD FOREIGN KEY ("personal_id") REFERENCES "personal" ("personal_id");
