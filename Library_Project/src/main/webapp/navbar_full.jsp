<nav class="navbar navbar-expand-lg navbar-light brown">
  <a class="navbar-brand" href="#"><b>Welcome <%=session.getAttribute("username") %>!</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="AllBooks.jsp">Show Books</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          How may I help!
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AddBook.jsp">Add Book</a>
          <a class="dropdown-item" href="ReturnBook.jsp">Return Book</a>
          <a class="dropdown-item" href="Authors.jsp">See Authors</a>
          <a class="dropdown-item" href="Publication.jsp">See Publications</a>
          <a class="dropdown-item" href="Languages.jsp">See Languages</a>
          
          
      </li>
      <li class="nav-item">
      <form action="LogoutServlet" method="post">
        <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Logout</button>
        </form>
      </li>
    </ul>
    <form action="SearchBar.jsp" class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" name= "search" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>