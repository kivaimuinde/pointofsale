<%-- 
    Document   : index
    Created on : Jan 25, 2023, 8:29:39 PM
    Author     : softnut
--%>
<%
if (session.getAttribute("username")==null){
    response.sendRedirect(request.getContextPath()+ "/login.jsp");
}else{
    response.sendRedirect(request.getContextPath()+ "/home.jsp");
 }
%>
