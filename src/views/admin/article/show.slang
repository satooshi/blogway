h1 Show Article
p = article.title
p = article.url
p = article.plain_text
p = article.is_public
p = article.published_at
p
  == link_to("Back", "/admin/articles", class: "btn btn-light btn-sm")
  == link_to("Edit", "/admin/articles/#{article.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/admin/articles/#{article.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
