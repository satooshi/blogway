-- +micrate Up
CREATE TABLE categories (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  url VARCHAR,
  parent_id INT,
  sort INT,
  description VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS categories;
