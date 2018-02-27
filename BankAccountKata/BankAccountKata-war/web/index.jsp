
<%@page import="java.util.ArrayList"%> 
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Simple login form</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
  <div class="container">
  <div class="login">
  	<h1 class="login-heading">
      <strong>Welcome.</strong> Please login.</h1>
      <form action="ConnexionAction"  method="post">
      Veuillez saisir vos paramètres de connexion
		<hr>

		<%
			ArrayList erreurs = (ArrayList) request.getAttribute("erreurs");
			if (erreurs != null) {
				out.println("<ul>");
				for (int i = 0; i < erreurs.size(); i++) {
					out.println("<li> " + (String) erreurs.get(i) + "</li>");
				}
				out.println("</ul>");
			}
		%>
        <input type="text" name="login" placeholder="Username" required="required" class="input-txt" />
          <input type="password" name="password" placeholder="Password" required="required" class="input-txt" />
          <div class="login-footer">
             
            <button type="submit" class="btn btn--right">Sign in  </button>
    
          </div>
      </form>
  </div>
</div>
  
    <script src="js/index.js"></script>

</body>
</html>