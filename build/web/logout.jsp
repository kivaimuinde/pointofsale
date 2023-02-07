<%-- 
    Document   : logout
    Created on : Jan 29, 2023, 6:33:24 AM
    Author     : softnut
--%>

<%
session.invalidate();
response.sendRedirect(request.getContextPath());
%>