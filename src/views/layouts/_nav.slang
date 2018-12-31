- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/articles" ? "active" : ""
a class="nav-item #{active}" href="/articles" Articles
