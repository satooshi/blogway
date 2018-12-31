-- +micrate Up
CREATE TABLE articles (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR,
  markdown TEXT,
  html TEXT,
  plain_text TEXT,
  is_public BOOL,
  published_at TIMESTAMP,
  url VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS articles;
