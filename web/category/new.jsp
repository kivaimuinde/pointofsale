<%-- 
    Document   : new
    Created on : Feb 1, 2023, 10:42:17 AM
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.CategoryModel" %>
<%@page import="controller.CategoryController" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Timestamp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            New Product Categories 
        </title>
        <jsp:include page="../include/css/css.jsp"></jsp:include>
        <jsp:include page="../include/js/js.jsp"></jsp:include> 
        </head>
        <body>

        <%
   if(session.getAttribute("status")!=null){
   if (session.getAttribute("status").toString().equalsIgnoreCase("inactive")||
   session.getAttribute("status").toString().equalsIgnoreCase("suspended")){
   response.sendRedirect(request.getContextPath()+"/account_status.jsp");
       }else{
        %>


        <!--Main Navigation-->
        <jsp:include page="../side_nav.jsp"></jsp:include>
            <!--Main Navigation-->

            <!--Main layout-->
            <main style="margin-top: 58px;">
                <div class="container-fluid h-100 ">
                    <div class="d-flex row justify-content-center align-items-center h-100">
                        <div class="col alert">
                            <p class="h2 text-center">Add Product Category </p>

                        </div>
                    </div>
                </div>
            </main>
            <!--Main layout-->
        <%
            }}else{
response.sendRedirect(request.getContextPath()+"/login.jsp");
}
        %>

    </body>
</html>