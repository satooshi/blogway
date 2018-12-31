- if category.errors
  ul.errors
    - category.errors.each do |error|
      li = error.to_s

== form(action: "/categories/#{category.id.to_s}", method: category.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: category.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "url", value: category.url, placeholder: "Url", class: "form-control")
  .form-group
    == text_field(name: "parent_id", value: category.parent_id, placeholder: "Parent_id", class: "form-control")
  .form-group
    == text_field(name: "sort", value: category.sort, placeholder: "Sort", class: "form-control")
  .form-group
    == text_field(name: "description", value: category.description, placeholder: "Description", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("Back", "/categories", class: "btn btn-light btn-sm")
