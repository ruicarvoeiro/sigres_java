<%@ page language="java" contentType="text/html; charset=UTF-8" import="PackageServlets.UserBean" %>
<%@page import="PackageServlets.SalaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Object valor = session.getAttribute("loginOK");
    if (valor == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../style.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" href="tabela.css">

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="validaData.js"></script>

        <script>
            $(function () {
                $("#datepicker").datepicker({dateFormat: 'dd/mm/yy'});
            });
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>SIGRES: Adicionar Reservas</title>
    </head>

    <body>
        <jsp:include page="../cabecalho.jsp" flush="false"></jsp:include>
            <div id="conteudo">
                <h1>Selecione uma sala:</h1>
                <hr>
                <br>
                <br>
                <form action="../horario_sala" method="GET">
                    <label>Sala:</label>
                <%ArrayList salas = SalaDAO.getAllSalasImprimir();
                        session.setAttribute("salas", salas);%>
                <select name="sala">
                    <c:forEach items="${salas}" var="sala">
                        <option value="${sala["LOCALIZACAO"]}">${sala["LOCALIZACAO"]}</option>
                    </c:forEach>

                </select>
                <br>
                <label>Data: </label>
                <input type="date" id="datepicker" name="data">
                <br>
                <input type="submit" id="subb" value="Pesquisar sala" onClick="return empty()">
            </form>
        </div>
        <hr>
        <jsp:include page="../rodape.jsp" flush="false"></jsp:include>
    </body>
</html>
