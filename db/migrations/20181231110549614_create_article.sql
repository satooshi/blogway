-- +micrate Up
CREATE TABLE articles (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  markdown TEXT NOT NULL,
  html TEXT NOT NULL,
  plain_text TEXT NOT NULL,
  is_public BOOL NOT NULL DEFAULT false,
  published_at TIMESTAMP,
  url VARCHAR NOT NULL,
  category_id BIGINT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE INDEX index_articles_on_category_id ON public.articles USING btree (category_id);

ALTER TABLE ONLY public.articles
  ADD CONSTRAINT fk_articles_to_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id)

-- +micrate Down
DROP TABLE IF EXISTS articles;
