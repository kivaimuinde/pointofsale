<%-- 
    Document   : index
    Created on : Jan 27, 2023, 3:33:00 PM
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
        <title>User Accounts (ALL)</title>
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
                            <p class="h2 align-items-center">USER ACCOUNTS (ALL)</p>
                            <table class="table">
                                <tr>
                                    <th>#</th>
                                    <th>USER ID</th>
                                    <th>USERNAME</th>
                                    <th>ACCOUNT CATEGORY</th>
                                    <th>ACCOUNT STATUS</th>
                                    <th></th>
                                </tr>
                            <%
                                UserModel model= new UserModel();
                                model.setUsername(session.getAttribute("username").toString());
                            ResultSet rs=UserController.allAccounts(model);
                            int count=0;
                            if(!rs.next()){
                            %>
                            <tr>
                                <td colspan="4">
                                    <div class="alert alert-warning">
                                        <p class="text text-default">No records found</p>
                                    </div>
                                </td>
                            <tr>
                                <%
                                    }else{
        do{
        count++;
        String username=rs.getString("username");
        int id=rs.getInt("id");
    String category=rs.getString("category");
    String status=rs.getString("status");

                                %>
                            <tr>
                                <td><%=count%></td>
                                <td><%=id%></td>
                                <td><%=username%></td>
                                <td><%=category%></td>
                                <td><%=status%></td>
                                <%
                                if (session.getAttribute("category").toString().equals("admin")){
                                %>
                                <td>
                                    <%
                                    if(status.equalsIgnoreCase("inactive")){
                                    //activate
                                    %>

                                    <a href="<%=request.getContextPath()%>/accounts/activate.jsp?username=<%=username%>&id=<%=id%>" class="btn btn-primary">Activate</a>
                                    <%
                                
                                        }else if(status.equalsIgnoreCase("active")){
    //suspend
                                    %>
                                    <a href="<%=request.getContextPath()%>/accounts/suspend.jsp?username=<%=username%>&id=<%=id%>" class="btn btn-danger"> <i class="fa fa-pause" aria-hidden="true"></i> Suspend</a>
                                    <%
                                        }else{
                                        //restore
                                    %>
                                    <a href="<%=request.getContextPath()%>/accounts/restore.jsp?username=<%=username%>&id=<%=id%>" class="btn btn-success"> <i class="fas fa-trash-restore"></i> Restore</a>
                                    <%
                                        }
                                    %>
                                </td>
                                <%
                                    }
                                %>
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