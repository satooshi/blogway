.row
  .col-sm-11
    h2 Articles
  .col-sm-1
    a.btn.btn-success.btn-sm href="/admin/articles/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Url
        th Plain_text
        th Is_public
        th Published_at
        th Actions
    tbody
      - articles.each do |article|
        tr
          td = article.title
          td = article.url
          td = article.plain_text.to_s[0, 100]
          td = article.is_public
          td = article.published_at
          td
            span
              == link_to("Show", "/admin/articles/#{article.id}", class: "btn btn-primary btn-sm")
              == link_to("Edit", "/admin/articles/#{article.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/admin/articles/#{ article.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
