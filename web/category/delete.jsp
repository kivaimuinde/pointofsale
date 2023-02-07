<%-- 
    Document   : delete
    Created on : Feb 1, 2023, 10:20:55 AM
    Author     : sa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.CategoryModel" %>
<%@page import="model.UserModel" %>
<%@page import="controller.CategoryController" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Timestamp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            Delete 
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
                                    <p class="h2 text-center">
                                        Delete
                                    <%
                                    if(request.getParameter("c_name")!=null){
                                    %><%=request.getParameter("c_name")%>
                                    <%
                                        }else{
                                    %>
                                    Product Category
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

CategoryModel cModel= new CategoryModel();
cModel.setId(cid);
cModel.setName(c_name);
UserModel uModel= new UserModel();
uModel.setId(Integer.parseInt(session.getAttribute("id").toString()));

int x=CategoryController.deleteCategory(cModel);
int y=CategoryController.saveDelete(cModel,uModel);
if(x>0){

                        %>
                        <p class="text text-success"><b><%=c_name%></b> successfully deleted</p>
                                <%

                                    }else{
                                %>
                        <p class="text text-danger">Something went wrong. Please try again later</p>
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