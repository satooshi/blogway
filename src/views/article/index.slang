.row
  .col-sm-11
    h2 Articles
  .col-sm-1
    a.btn.btn-success.btn-sm href="/articles/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Markdown
        th Html
        th Plain_text
        th Is_public
        th Published_at
        th Url
        th Actions
    tbody
      - articles.each do |article|
        tr
          td = article.title
          td = article.markdown
          td = article.html
          td = article.plain_text
          td = article.is_public
          td = article.published_at
          td = article.url
          td
            span
              == link_to("Show", "/articles/#{article.id}", class: "btn btn-primary btn-sm")
              == link_to("Edit", "/articles/#{article.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/articles/#{ article.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
