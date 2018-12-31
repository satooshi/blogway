- if article.errors
  ul.errors
    - article.errors.each do |error|
      li = error.to_s

== form(action: "/admin/articles/#{article.id.to_s}", method: article.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: article.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_field(name: "url", value: article.url, placeholder: "Url", class: "form-control")
  .form-group
    == text_area(name: "markdown", content: article.markdown, placeholder: "Markdown", class: "form-control", size: "30x10")
  .form-group
      == label(:is_public) do
        == check_box(:is_public, checked: article.is_public.to_s == "1")

  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("Back", "/admin/articles", class: "btn btn-light btn-sm")
