INSERT INTO country
  (country_name, country_code)
VALUES
  ('India', 'IND');

INSERT INTO "state"
  (state_name, state_code, country_code)
VALUES
  ('Tamil Nadu', 'TN', 'IND');

INSERT INTO  city
  (city_name, city_code, state_code)
VALUES
  ('Chennai', 'MAS', 'TN');

INSERT INTO college
  (college_name, college_code, city_code)
VALUES
  ('Velammal Engineering College', 'IND-TN-MAS-001', 'MAS');
