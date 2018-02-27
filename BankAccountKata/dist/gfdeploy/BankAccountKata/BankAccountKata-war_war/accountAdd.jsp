<%@include file="entete.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
         <title>Add an account</title>
 <script src="js/jquery-1.8.2.js"></script>
 <script type="text/javascript" src="js/bootstrapvalidator.min.js"></script> 
</head>
<body>
   
  <div class="container" id="page-content-wrapper">
    <div class="row">
      <div class="col-md-4">
        <h2>Add an account</h2>
        <form action="AccountAddAction" method="post" id="contact_form">
          <div class="form-group">
            <label>Account number </label>
            <input type="text" class="form-control" name="accountNumber">
          </div>
            <div class="form-group">
                <label>User namer</label> 
                 <select   class="form-control" name="user">
                    <c:forEach var="c" items="${users}">
                         <option value="${c.idUser}">${c.name}</option>     
                     </c:forEach>
                  </select>
            </div>  
            <div class="form-group">
            <label>Balance </label>
            <input type="text" class="form-control" name="balance">
          </div> 
            
            
          <!-- Indicates a successful or positive action -->
          <div class="form-group">
              <button type="submit" name="addAccount" class="btn btn-success btn-form">Add</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  </div>
</body>

</html>