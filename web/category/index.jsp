<%-- 
    Document   : index
    Created on : Jan 29, 2023, 12:32:00 PM
    Author     : softnut
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
        <title>Product Categories (ALL)</title>
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
                            <div class="row">
                                <div class="col-10">
                                    <p class="h2 text-center">PRODUCT CATEGORIES (ALL)</p>
                                </div>
                                <div class="col-2">
                                    <a href="<%=request.getContextPath()%>/category/new.jsp" class="btn btn-md btn-primary">Add New</a>
                            </div>
                        </div>
                        <table class="table table-striped">
                            <tr>
                                <th>#</th>
                                <th>CATEGORY NAME</th>
                                <th>DATE ADDED</th>
                                <th>LAST UPDATE</th>
                                <th></th>
                            </tr>
                            <%
                                CategoryModel model= new CategoryModel();
                            ResultSet rs=CategoryController.allCategories();
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
        int cid=rs.getInt(1);
String name=rs.getString(2);
Timestamp date_added=rs.getTimestamp(4);

                                %>
                            <tr>
                                <td><%=count%></td>
                                <td><%=name%></td>
                                <td><%=date_added%></td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/category/details.jsp?cid=<%=cid%>&c_name=<%=name%>" class="btn btn-success"> <i class="fa fa-info-circle" aria-hidden="true"></i> Details</a>
                                    <a href="<%=request.getContextPath()%>/category/edit.jsp?cid=<%=cid%>" class="btn btn-primary"> <i class="fas fa-trash-restore"></i> Edit</a>
                                    <a href="<%=request.getContextPath()%>/category/delete.jsp?cid=<%=cid%>&c_name=<%=name%>" class="btn btn-danger"> <i class="fa fa-pause" aria-hidden="true"></i> Delete</a>
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
            }
}else{
response.sendRedirect(request.getContextPath()+"/login.jsp");
}
        %>

    </body>
</html>