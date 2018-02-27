<%@page import="java.util.ArrayList"%>
<%@include file="entete.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
         <title>Do a Deposit</title>
 <script src="js/jquery-1.8.2.js"></script>
 <script type="text/javascript" src="js/bootstrapvalidator.min.js"></script> 
</head>
<body>
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
  <div class="container" id="page-content-wrapper">
    <div class="row">
      <div class="col-md-4">
            <h2>Do a Deposit </h2>
        <form action="OperationAction" method="post" id="contact_form">
           
            <div class="form-group">
                <label>Account number</label> 
                 <select   class="form-control" name="account">
                    <c:forEach var="c" items="${accounts}">
                         <option value="${c.accountNumber}">${c.accountNumber}</option>     
                     </c:forEach>
                  </select>
            </div> 
            <div class="form-group">
                <label>Account number</label> 
                 <select   class="form-control" name="type">
                    <option value="Deposit">Deposit</option>     
                    <option value="WithDrawal">WithDrawal</option>                          
                  </select>
            </div>  
            <div class="form-group">
            <label>Amount </label>
            <input type="text" class="form-control" name="amount">
          </div> 
            
            
          <!-- Indicates a successful or positive action -->
          <div class="form-group">
              <button type="submit" name="doDeposit" class="btn btn-success btn-form">Ok</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  </div>
</body>

</html>