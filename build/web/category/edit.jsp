<%-- 
    Document   : edit
    Created on : Jan 31, 2023, 2:36:24 PM
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
        <title>Update Category Details</title>
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
                        <div class="col">

                            <div class="row">
                                <div class="col-10">
                                    <p class="h2 text-center">Edit Product Category Details</p>
                                </div>
                                <div class="col-2">
                                    <a href="<%=request.getContextPath()%>/category/new.jsp" class="btn btn-md btn-primary">Add New</a>
                            </div>
                        </div>
                        <%
                           
String name="";
                        String description="";
                        int cid=0;
                        int uid=0;
 if(request.getParameter("cid")!=null && request.getParameter("cid")!=null){
                            
                        cid=Integer.parseInt(request.getParameter("cid"));
                        uid=Integer.parseInt(session.getAttribute("id").toString());
                            
                            
                        
                            
                        CategoryModel cModel= new CategoryModel();                            
                        UserModel uModel= new UserModel();
                            
                            
                            
                        cModel.setId(cid);
                            
                        uModel.setId(uid);
                        ResultSet rs=CategoryController.categoryDetails(cModel);
                        if(rs.next()){
                            // set variables
                            name=rs.getString("name");
                            description=rs.getString("description");
                            }else{
                            //show error
                        %>
                        <p class="text text-danger">We could not fetch category details for update</p>
                        <%
                            }
}
                        %>

                        <%
                        //form processing section
                        if(request.getParameter("edit")!=null &&
                        !request.getParameter("edit").equals("")){
                        
                        String new_name=request.getParameter("name");
                        String old_name=request.getParameter("old_name");
                        String new_description=request.getParameter("description");
                        String old_description=request.getParameter("old_description");
                        int cat_id=Integer.parseInt(request.getParameter("cid"));
                        
                        
                        CategoryModel category=new CategoryModel();
                        category.setName(new_name);
                        category.setDescription(new_description);
                        category.setId(cat_id);
                        
                        UserModel user= new UserModel();
                        user.setId(Integer.parseInt(session.getAttribute("id").toString()));
                        
                        int update=CategoryController.updateCategory(category);
                        if(update>0){
                        
                        //record update activity
                        category.setOld_name(old_name);
                        category.setOld_description(old_description);
                        int record_update=CategoryController.saveUpdate(category, user);
                        //hide form
                        %>
                        <script type="text/javascript">
                            function hideForm() {
                                document.getElementById('edit_form').style.display = 'none';
                            }
                            hideForm();
                        </script>
                        <div class="alert alert-info">
                            <p class="text text-success">Successfully updated</p>
                        </div>
                        <%
                        // show success message
                            }else{
                        %>
                        <div class="alert alert-info">
                            <p class="text text-danger">Something went wrong please try again</p>
                        </div>
                        <%
                            }
                            }
                        %>
                        <%
                        if(request.getParameter("cid")!=null && request.getParameter("cid")!=null){
                        %>
                        <form id="edit_form" action="edit.jsp" method="post">
                            <input type="hidden" name="cid" value="<%=cid%>"/>
                            <input type="hidden" name="old_name" value="<%=name%>"/>                            
                            <input type="hidden" name="old_description" value="<%=description%>"/>
                            <div class="form-group">
                                <label>Category Name</label>
                                <input class="form-control form-control-lg" name="name" value="<%=name%>"
                                       type="text" required="">
                            </div>
                            <div class="form-group">                            
                                <label>Category Description</label>
                                <textarea class="form-control form-control-lg" name="description"><%=description%></textarea>
                            </div>
                            <div class="form-group">
                                <label>..</label>
                                <input type="submit" name="edit" value="Update category Details" 
                                       class="form-control btn btn-info btn-lg btn-block">
                            </div>
                        </form>
                            <%
                            
                                }else{
%>
<p class="text text-danger text-center">Soemthing went wrog, pease try again</p>
                        <%
}
                            %>

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