<%-- 
    Document   : activate
    Created on : Jan 27, 2023, 3:52:01 PM
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
        <title>Activate user Account (<%=request.getParameter("username")%>)</title>
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
                    <div class="row justify-content-center align-items-center h-100 ">
                        <div class="alert alert-info">
                            <div>
                                <p class="h2 align-items-center">
                                    Activate <%=request.getParameter("username")%>'s Account
                            </p>
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
                
                        int x=UserController.activateAccount(model);
                
                        if(x>0){
                        //update successful: show message
                        %>
                        <div>
                            <p class="text text-default">Account successfully activated. Click <a href="<%=request.getContextPath()%>/accounts">here</a> to go back.</p>
                        </div>
                        <%
                        }else{
                        //update not successful: show message
                        %>
                        <div>
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