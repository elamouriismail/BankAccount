<%@include file="entete.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
         <title>Add a user</title>
 <script src="js/jquery-1.8.2.js"></script>
 <script type="text/javascript" src="js/bootstrapvalidator.min.js"></script> 
</head>
<body>
   
  <div class="container" id="page-content-wrapper">
    <div class="row">
        < 
      <div class="col-md-4">
        <h2>Add a user </h2>
        <form action="UserAddAction" method="post" id="contact_form">
          <div class="form-group">
            <label>Name </label>
            <input type="text" class="form-control" name="name">
          </div> 
            <div class="form-group">
            <label>Login </label>
            <input type="text" class="form-control" name="login">
          </div> 
            <div class="form-group">
            <label>Password </label>
            <input type="password" class="form-control" name="password">
          </div> 
            
          <!-- Indicates a successful or positive action -->
          <div class="form-group">
              <button type="submit" name="addUser" class="btn btn-success btn-form">Add</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  </div>
</body>

</html>