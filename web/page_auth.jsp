<%-- 
    Document   : page_auth
    Created on : Jan 26, 2023, 12:48:30 PM
    Author     : softnut
--%>

<%
if(session.getAttribute("username").toString().equals(null)){
response.sendRedirect(request.getContextPath()+"/login.jsp");
}
if(session.getAttribute("status").toString().equalsIgnoreCase("suspended") ||
         session.getAttribute("status").toString().equalsIgnoreCase("inactive")){
response.sendRedirect(request.getContextPath()+"/account_status.jsp");
    }
%>