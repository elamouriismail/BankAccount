<%-- 
    Document   : pdfStatementPrinting
    Created on : 27 févr. 2018, 13:20:07
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gct_bd?zeroDateTimeBehavior=convertToNull", "root", "");
                File reportFile = new File(application.getRealPath("statementPrinting.jasper"));
                Long idstatement = (Long)request.getAttribute("idstatement");
                Map parameter = new HashMap();
                parameter.put("idstatement", idstatement);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameter, conn);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>
