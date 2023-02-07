<%-- 
    Document   : details
    Created on : Jan 31, 2023, 10:03:31 AM
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
            Product Categories 
            <%
            if(request.getParameter("c_name")!=null && request.getParameter("cid")!=null){
            %>
            (<%=request.getParameter("c_name")%>)
            <%
            }
            %>
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
                            <div class="row">
                                <div class="col-10">
                                    <p class="h2 text-center"> Category :
                                    <%
                                    if(request.getParameter("c_name")!=null){
                                    %><%=request.getParameter("c_name")%>
                                    <%
                                        }else{
                                    %>
                                    Category Description
                                    <%
                                            }
                                    %>
                                </p>
                            </div>
                            <div class="col-2">
                                <a href="<%=request.getContextPath()%>/category/new.jsp" class="btn btn-md btn-primary">Add New</a>
                            </div>
                        </div>

                        <%
                            
String c_name=request.getParameter("c_name");
int cid=Integer.parseInt(request.getParameter("cid"));

CategoryModel m= new CategoryModel();
m.setId(cid);
ResultSet rs=CategoryController.categoryDetails(m);
if(rs.next()){
                        %>
                        <p class="text text-default"><%=rs.getString("description")%></p>
                        <%
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