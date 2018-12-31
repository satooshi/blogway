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
      - articles.each do |articles|
        tr
          td = articles.title
          td = articles.markdown
          td = articles.html
          td = articles.plain_text
          td = articles.is_public
          td = articles.published_at
          td = articles.url
          td
            span
              == link_to("Show", "/articles/#{articles.id}", class: "btn btn-primary btn-sm")
              == link_to("Edit", "/articles/#{articles.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/articles/#{ articles.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
