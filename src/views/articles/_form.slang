- if articles.errors
  ul.errors
    - articles.errors.each do |error|
      li = error.to_s

== form(action: "/articles/#{articles.id.to_s}", method: articles.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "title", value: articles.title, placeholder: "Title", class: "form-control")
  .form-group
    == text_area(name: "markdown", content: articles.markdown, placeholder: "Markdown", class: "form-control", size: "30x10")
  .form-group
    == text_area(name: "html", content: articles.html, placeholder: "Html", class: "form-control", size: "30x10")
  .form-group
    == text_area(name: "plain_text", content: articles.plain_text, placeholder: "Plain_text", class: "form-control", size: "30x10")
  .form-group
      == label(:is_public) do
        == check_box(:is_public, checked: articles.is_public.to_s == "1")
  .form-group
    == text_field(name: "published_at", value: articles.published_at, placeholder: "Published_at", class: "form-control")
  .form-group
    == text_field(name: "url", value: articles.url, placeholder: "Url", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("Back", "/articles", class: "btn btn-light btn-sm")
