<%-- 
    Document   : restore
    Created on : Jan 27, 2023, 4:27:16 PM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.UserModel" %>
<%@page import="controller.UserController" %>
<%@page import="java.sql.ResultSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restore user Account (<%=request.getParameter("username")%>)</title>
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

                <div class="container-fluid h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100  alert alert-info ">
                        <div class="col col-sm-12 col-md-12 col-lg-8 col-xl-8">
                            <p class="h2 align-items-center">Restore <%=request.getParameter("username")%>'s Account</p>
                    </div>
                    <%
                    
                     if(request.getParameter("username")!=null && 
                    !request.getParameter("username").equals("") &&
                    request.getParameter("id")!=null && 
                    !request.getParameter("id").equals("") ){
                    String username=request.getParameter("username");
                    int id=Integer.parseInt(request.getParameter("id"));
                    
                    UserModel model= new UserModel();
                    model.setUsername(username);
                    model.setId(id);
                
                    int x=UserController.restoreAccount(model);
                
                    if(x>0){
                    //update successful: show message
                    %>
                    <div class="col col-sm-12 col-md-12 col-lg-8 col-xl-8">
                        <p class="text text-default">Account successfully restored. Click <a href="<%=request.getContextPath()%>/accounts">here</a> to go back.</p>
                    </div>
                    <%
                    }else{
                    //update not successful: show message
                    %>
                    <div class="col col-sm-12 col-md-12 col-lg-8 col-xl-8">
                        <p class="text text-danger">
                            Something went wrong, please try again later.<br>
                            Click <a href="<%= request.getContextPath()%>/accounts">here</a> to go back.
                        </p>
                    </div>
                    <%
                    }
}
                    
                    %>
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