<%@page import="PackageServlets.Carateristicas"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="PackageServlets.UserBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>

        <title>SIGRES: Adicionar Reservas</title>
    </head>

    <body>
        <jsp:include page="../cabecalho.jsp" flush="false"></jsp:include>
            <div id="conteudo">
                <h1>Nova reserva</h1>
                <hr>
                <br>
                <br>
                <form action="../horario_car" method="GET">
                    <!--<label>Data: </label>
                    <input type="date" id="datepicker" name="data">

                    <label>Hora ínicio:</label>
                    <input type="date" name="horaI">
                    <br>

                    <label>Hora fim:</label>
                    <input type="date" name="horaF">
                    <br>-->

                    <h3>Carateristicas da sala:</h3>
                <%
                    ArrayList lista = (ArrayList) Carateristicas.get();
                    session.setAttribute("lista", lista);
                %>

                <c:forEach items="${lista}" var="carateristica">
                    <c:choose>
                        <c:when test="${carateristica['SOFTWARE']=='1'}">
                            <input type="checkbox" name="${carateristica['NOME']}">
                            <label>${carateristica['NOME']}</label>
                        </c:when>    
                        <c:otherwise>
                            <label>${carateristica['NOME']}</label>
                            <input type="number" name="${carateristica['NOME']}" value=0>
                        </c:otherwise>
                    </c:choose>
                    <br>
                </c:forEach>
                <input type="submit" value="Clique aqui">
            </form>
        </div>
        <hr>
        <jsp:include page="../rodape.jsp" flush="false"></jsp:include>
    </body>
</html>
