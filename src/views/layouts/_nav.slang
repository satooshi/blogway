- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/admin/articles" ? "active" : ""
a class="nav-item #{active}" href="/admin/articles" Articles
- active = context.request.path == "/admin/categories" ? "active" : ""
a class="nav-item #{active}" href="/admin/categories" Categories
