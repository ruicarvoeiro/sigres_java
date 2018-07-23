<%@ page language="java" contentType="text/html; charset=utf-8" import="PackageServlets.UserBean" %>
<%
    Object valor = session.getAttribute("loginOK");
    Object user = session.getAttribute("currentSessionUser");

    if (valor == null || user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <link rel="stylesheet" type="text/css" href="../style.css">
        <!--<link rel="stylesheet" type="text/css" href="../b/css/bootstrap.css">-->

        <link rel="stylesheet" type="text/css" href="../css/style.css">

        <title>SIGRES Listar Reservas</title>
    </head>

    <body>
        <jsp:include page="cabecalho.jsp" flush="false"></jsp:include>
        <jsp:include page="ListarReservas/index.jsp" flush="false"></jsp:include>
        <jsp:include page="rodape.jsp" flush="false"></jsp:include>
    </body>
</html>