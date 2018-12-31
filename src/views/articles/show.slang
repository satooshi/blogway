h1 Show Articles
p = articles.title
p = articles.markdown
p = articles.html
p = articles.plain_text
p = articles.is_public
p = articles.published_at
p = articles.url
p
  == link_to("Back", "/articles", class: "btn btn-light btn-sm")
  == link_to("Edit", "/articles/#{articles.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/articles/#{articles.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
