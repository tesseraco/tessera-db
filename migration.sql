CREATE EXTENSION "uuid-ossp";

CREATE TABLE country
(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR NOT NULL,
  country_code VARCHAR NOT NULL
);

CREATE TABLE "state"
(
  state_id SERIAL PRIMARY KEY,
  state_name VARCHAR NOT NULL,
  state_code VARCHAR NOT NULL,
  country_id INTEGER NOT NULL REFERENCES country(country_id) ON DELETE CASCADE
);

CREATE TABLE city
(
  city_id SERIAL PRIMARY KEY,
  city_name VARCHAR NOT NULL,
  city_code VARCHAR NOT NULL,
  state_id INTEGER NOT NULL REFERENCES state(state_id) ON DELETE CASCADE
);

CREATE TABLE college
(
  college_id SERIAL PRIMARY KEY,
  college_name VARCHAR NOT NULL,
  college_code VARCHAR NOT NULL,
  city_id INTEGER NOT NULL REFERENCES city(city_id) ON DELETE CASCADE
);

CREATE TABLE domain
(
  domain_id SERIAL PRIMARY KEY,
  domain_name VARCHAR,
  is_global BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "role"
(
  role_id SERIAL PRIMARY KEY,
  role_name VARCHAR NOT NULL
);

CREATE TABLE "group"
(
  group_id SERIAL PRIMARY KEY,
  group_name VARCHAR NOT NULL
);

CREATE TABLE "user"
(
  user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  dob DATE,
  email VARCHAR NOT NULL,
  hashed_password VARCHAR NOT NULL,
  mobile_number NUMERIC,
  is_verified BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE user_interested_domain_mapping
(
  user_id UUID NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
  domain_id INTEGER NOT NULL REFERENCES domain(domain_id) ON DELETE CASCADE,
  UNIQUE (user_id, domain_id)
);

CREATE TABLE user_experienced_domain_mapping
(
  user_id UUID NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
  domain_id INTEGER NOT NULL REFERENCES domain(domain_id) ON DELETE CASCADE,
  UNIQUE (user_id, domain_id)
);

CREATE TABLE user_college_mapping
(
  user_id UUID NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
  college_id INTEGER NOT NULL REFERENCES college(college_id) ON DELETE CASCADE,
  role_id INTEGER NOT NULL REFERENCES "role"(role_id) ON DELETE CASCADE,
  UNIQUE (user_id, college_id)
);

CREATE TABLE user_group_maaping
(
  user_id UUID NOT NULL REFERENCES "user"(user_id) ON DELETE CASCADE,
  group_id INTEGER NOT NULL REFERENCES "group"(group_id) ON DELETE CASCADE,
  is_admin BOOLEAN NOT NULL DEFAULT FALSE,
  UNIQUE (user_id, group_id)
);
