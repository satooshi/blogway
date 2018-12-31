h1 Show Category
p = category.name
p = category.url
p = category.parent_id
p = category.sort
p = category.description
p
  == link_to("Back", "/admin/categories", class: "btn btn-light btn-sm")
  == link_to("Edit", "/admin/categories/#{category.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/admin/categories/#{category.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
