<%-- 
    Document   : accountsConsultation
    Created on : 27 févr. 2018, 11:04:22
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="entete.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
    </head>
    <body>
       <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3>Accounts</h3>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="col-md-12">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <td>Account number </td>
                                            <td>Balance</td> 
                                            <td>Action</td> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="c" items="${accounts}">
                                            <tr class="odd gradeX">
                                                <td>${c.accountNumber}</td>
                                                <td>${c.balance}</td> 
                                                
                                                <td>
                                                    <a class="btn btn-primary" href="AccountStatementConsultation?id=${c.accountNumber}"><span><i class="glyphicon glyphicon-search"></i>Show details</span></a>
                                                     <a class="btn btn-primary" href="statementPrintingPdf?id=${c.accountNumber}"><span><i class="glyphicon glyphicon-search"></i>Print</span></a>
                                                 </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    
                                    

                                </table>
                            </div>
                            <!-- /.table-responsive -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
