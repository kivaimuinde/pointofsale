<%-- 
    Document   : change_password
    Created on : Jan 30, 2023, 4:55:48 PM
    Author     : sa
--%>

<jsp:include page="page_auth.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.UserModel" %>
<%@page import="controller.UserController" %>
<%@page import="java.sql.ResultSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="include/css/css.jsp"></jsp:include>
        <jsp:include page="include/js/js.jsp"></jsp:include> 
        </head>
        <body>
        <%
        if (session.getAttribute("status").toString().equalsIgnoreCase("inactive")||
        session.getAttribute("status").toString().equalsIgnoreCase("suspended")){
        response.sendRedirect(request.getContextPath()+"/account_status.jsp");
            }else{
        %>


        <!--Main Navigation-->
        <jsp:include page="side_nav.jsp"></jsp:include>
            <!--Main Navigation-->

            <!--Main layout-->
            <main style="margin-top: 58px;">
                <div class="container-fluid h-100 ">
                    <div class="row justify-content-center align-items-center h-100">
                        <div class="col col-sm-12 col-md-10 col-lg-6 col-xl-6 alert alert-defult">
                            <p class="h2 align-items-center">Change My Password</p>
                        <%
                    
                        if(request.getParameter("submit")!=null && 
                        !request.getParameter("submit").equals("")){
                        
                        if(request.getParameter("password1")!=null && 
                    !request.getParameter("password1").equals("") &&
                    request.getParameter("password")!=null && 
                    !request.getParameter("password").equals("") ){
                    String password1=request.getParameter("password1");
                    String password=request.getParameter("password");
                    
                    //check is passwords match
                    if(!password1.equals(password)){
                        %>
                        <div>
                            <p class="text text-danger h6">Passwords do not match</p>
                        </div>
                        <%
                        }else{
UserModel model= new UserModel();
model.setUsername(session.getAttribute("username").toString());
model.setPassword(password);
int x=UserController.changePassword(model);
if(x>0){
                        %>
                        <div>
                            <p class="text text-success h6">Password successfully changed</p>
                        </div>
                        <%
}else{
                        %>
                        <div>
                            <p class="text text-danger h6">Something went wrong, please try again later</p>
                        </div>
                        <%
}
                    
                        }
}else{
                        %>
                        <div>
                            <p class="text text-danger h6">Fill all entries</p>
                        </div>
                        <%
                        }
                    }
                        %>
                        <form action="change_password.jsp" method="post">
                            <div class="form-group">                            
                                <label class="h5">New Password</label>
                                <input class="form-control form-control-md"  name="password"
                                       placeholder="Enter Password" type="password" required="">
                            </div>
                            <div class="form-group">                            
                                <label class="h5">Confirm Password</label>
                                <input class="form-control form-control-md"  name="password1"
                                       placeholder="Confirm Password" type="password" required="">
                            </div>
                            <label></label>
                            <div class="form-group">
                                <input type="submit" name="submit" value="Change Password" 
                                       class="btn btn-info btn-lg btn-block">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <!--Main layout-->
        <%
            }
        %>
    </body>
</html>
