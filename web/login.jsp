<%-- 
    Document   : login
    Created on : Jan 26, 2023, 9:21:12 AM
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
        <title>Welcome : Login</title>
        <jsp:include page="include/css/css.jsp"></jsp:include>
        <jsp:include page="include/js/js.jsp"></jsp:include> 
        </head>
        <body>
            <div class="container-fluid h-100 ">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col col-sm-12 col-md-10 col-lg-6 col-xl-6 alert alert-info">
                        <p class="h2 align-items-center">Login</p>
                    <%
                    
                    if(request.getParameter("login")!=null && 
                    !request.getParameter("login").equals("")){
                    
                    if(request.getParameter("username")!=null && 
                    !request.getParameter("username").equals("") &&
                    request.getParameter("password")!=null && 
                    !request.getParameter("password").equals("") ){
                    String username=request.getParameter("username");
                    String password=request.getParameter("password");
                    
                    UserModel model= new UserModel();
                    model.setUsername(username);
                    model.setPassword(password);
                    
                    ResultSet rs=UserController.userLogin(model);
                    if(rs.next()){
                    int id = rs.getInt("id");
                    String category = rs.getString("category");
                    String status = rs.getString("status");
                    session.setAttribute("id", id);
                    session.setAttribute("username", username);
                    session.setAttribute("category", category);
                    session.setAttribute("status", status);
                    
                    if(status.equalsIgnoreCase("suspended")||
                    status.equalsIgnoreCase("inactive")){
                    response.sendRedirect(request.getContextPath()+"/account_status.jsp");
                        }else{
                    response.sendRedirect(request.getContextPath()+"/home.jsp");
                        }
                        }else{
                    
                    %>
                    <div class="alert alert-warning">
                        <p class="text text-danger h5">Incorrect username and/or password.</p>
                    </div>
                    <%
                        }
}else{
                    %>
                    <div class="alert alert-warning">
                        <p class="text text-danger h5">Fill all entries.</p>
                    </div>
                    <%
                       
}
}
                    %>
                    <form action="login.jsp" method="post">
                        <div class="form-group">
                            <label>Username</label>
                            <input class="form-control form-control-lg" name="username"
                                   placeholder="username" type="text" required="">
                        </div>
                        <div class="form-group">                            
                            <label>Password</label>
                            <input class="form-control form-control-lg"  name="password"
                                   placeholder="******" type="password" required="">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="login" value="login" 
                                   class="btn btn-info btn-lg btn-block">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>