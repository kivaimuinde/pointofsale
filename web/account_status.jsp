<%-- 
    Document   : account_status
    Created on : Jan 27, 2023, 11:17:33 AM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Status (<%= session.getAttribute("status")%>)</title>
        <jsp:include page="include/css/css.jsp"></jsp:include>
        <jsp:include page="include/js/js.jsp"></jsp:include> 
        </head>
        <body>
            <div class="container-fluid h-100 ">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col col-sm-12 col-md-12 col-lg-8 col-xl-8 alert alert-info">
                        <p class="h2 align-items-center">Dear <%= session.getAttribute("username")%></p>
                    <div class="card">
                        <p>
                            You are seeing this page because your account is 
                            <b><%= session.getAttribute("status")%></b>.<br>
                            Contact system administrator for appropriate actions.
                         </p>
                         <p>
                             Click <a href="<%=request.getContextPath()%>/logout.jsp">here</a> to go back or close your browser.
                         </p>
                    </div>        
                </div>
            </div>
        </div>
    </body>
</html>