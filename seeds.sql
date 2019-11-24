INSERT INTO country
  (country_name, country_code)
VALUES
  ('India', 'IND');

INSERT INTO "state"
  (state_name, state_code, country_id)
VALUES
  ('Tamil Nadu', 'TN', 1);

INSERT INTO  city
  (city_name, city_code, state_id)
VALUES
  ('Chennai', 'MAS', 1);

INSERT INTO college
  (college_name, college_code, city_id)
VALUES
  ('Velammal Engineering College', '001', 1);
