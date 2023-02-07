<%-- 
    Document   : home
    Created on : Jan 26, 2023, 9:22:20 AM
    Author     : softnut
--%>
<jsp:include page="page_auth.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="include/css/css.jsp"></jsp:include>
        <jsp:include page="include/js/js.jsp"></jsp:include> 
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
        <jsp:include page="side_nav.jsp"></jsp:include>
            <!--Main Navigation-->

            <!--Main layout-->
            <main style="margin-top: 58px;">
                <div class="container pt-4">
                    <div class="container">
                        <div class="h-100 align-items-center justify-content-center">
                            <div>
                                <h1>Hello World!</h1>
                            </div>
                            <div>
                                <p>Username : <%= session.getAttribute("username")%></p>
                            <p>User ID: <%= session.getAttribute("id")%></p>
                            <p>User Category: <%= session.getAttribute("category")%></p>
                            <p>User Status: <%= session.getAttribute("status")%></p>
                            <p><a href="<%=request.getContextPath()%>/logout.jsp">Logout</a></p>
                        </div>
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
