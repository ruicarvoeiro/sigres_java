<%@ page language="java" contentType="text/html; charset=UTF-8" import="PackageServlets.UserBean" %>
<%
    Object valor = session.getAttribute("loginOK");
    if (valor == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <link rel="stylesheet" type="text/css" href="../style.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">

        <title>SIGRES: Confirmar Reservas</title>
    </head>

    <body>
        <jsp:include page="../cabecalho.jsp" flush="false"></jsp:include>
        <jsp:include page="_confirmarReservas.jsp" flush="false"></jsp:include>
            <hr>
        <jsp:include page="../rodape.jsp" flush="false"></jsp:include>
    </body>
</html>