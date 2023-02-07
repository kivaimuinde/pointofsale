<%-- 
    Document   : suspended
    Created on : Jan 27, 2023, 4:29:27 PM
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
        <title>Suspended Accounts</title>
        <jsp:include page="../include/css/css.jsp"></jsp:include>
        <jsp:include page="../include/js/js.jsp"></jsp:include> 
        </head>
        <body>
        <%
 if(session.getAttribute("status")!=null){
   if (session.getAttribute("status").toString().equalsIgnoreCase("inactive")||
   session.getAttribute("status").toString().equalsIgnoreCase("suspended")){
   response.sendRedirect(request.getContextPath()+"/account_status.jsp");
       }else{  %>


        <!--Main Navigation-->
        <jsp:include page="../side_nav.jsp"></jsp:include>
            <!--Main Navigation-->

            <!--Main layout-->
            <main style="margin-top: 58px;">
                <div class="container-fluid h-100 ">
                    <div class="d-flex row justify-content-center align-items-center h-100">
                        <div class="alert alert-info">
                            <p class="h2 align-items-center">Suspended Accounts</p>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>USER ID</th>
                                    <th>USERNAME</th>
                                    <th>ACTIVATE ACCOUNT</th>
                                </tr>
                            <%
                                 UserModel m= new UserModel();
                                m.setExcept(session.getAttribute("username").toString());
                            ResultSet rs=UserController.suspendedAccounts(m);
                            int count=0;
                            if(!rs.next()){
                            %>
                            <tr>
                                <td colspan="4">
                                    <div>
                                        <p class="text text-default">There are no suspended accounts. Please check again later<br>
                                            Click <a href="<%=request.getContextPath()%>/accounts">here</a> to go back</p>
                                    </div>
                                </td>
                            <tr>
                                <%
                                    }else{
        do{
        count++;
        UserModel model= new UserModel();
        String username=rs.getString("username");
        int id=rs.getInt("id");
        model.setId(id);
        model.setUsername(username);

                                %>
                            <tr>
                                <td><%=count%></td>
                                <td><%=rs.getInt("id")%></td>
                                <td><%=rs.getString("username")%></td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/accounts/restore.jsp?username=<%=username%>&id=<%=id%>" class="btn btn-primary">Restore</a>
                                </td>
                            </tr>
                            <%
    }while(rs.next());
    }
                            %>
                        </table>
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