-- +micrate Up
CREATE TABLE categories (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  url VARCHAR NOT NULL,
  sort INT NOT NULL DEFAULT 0,
  description VARCHAR,
  parent_id INT DEFAULT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX index_categories_on_parent_id ON public.categories USING btree (parent_id);

ALTER TABLE public.categories ADD UNIQUE("name");
ALTER TABLE public.categories ADD UNIQUE("url");

-- +micrate Down
DROP TABLE IF EXISTS categories;
