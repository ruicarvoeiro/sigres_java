<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import="PackageServlets.UserBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Object valor = session.getAttribute("loginOK");
    Object user = session.getAttribute("currentSessionUser");

    if (valor == null || user == null) {
        response.sendRedirect("login.jsp");
    }

    String diaSemana = request.getParameter("diaSemana");
%>

<html>
    <head>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="AdicionarReservas/clickReservas.js"></script>

        <link rel="stylesheet" type="text/css" href="../style.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">

        <link rel="stylesheet" type="text/css" href="AdicionarReservas/tabela.css">
        <title>SIGRES Listar Reservas</title>
    </head>

    <body>
        <jsp:include page="../cabecalho.jsp" flush="false"></jsp:include>
            <div id="conteudo"><h1>Resultado</h1>
                <br>
                <br>

            <% ArrayList tabela = (ArrayList) request.getAttribute("tabela");
                if (tabela != null) {
            %>
            <div id="reserva">
                <h1>Nova reserva:</h1>
                <jsp:include page="reserva.jsp" flush="false"></jsp:include>
                </div>
                <table id="tabela2">
                    <tr>
                        <th>Horário</th>
                        <th>Seg</th>
                        <th>Ter</th>
                        <th>Qua</th>
                        <th>Qui</th>
                        <th>Sex</th>
                        <th>Sab</th>
                    </tr>

                <c:forEach items="${tabela}" var="linha">
                    <tr class="${linha["HORAS"]}">
                        <td class="${linha["HORAS"]}">
                            ${linha["HORAS"]}
                        </td>
                        <td class="estado${linha["0"]}">
                        </td>
                        <td class="estado${linha["1"]}">
                        </td>
                        <td class="estado${linha["2"]}">
                        </td>
                        <td class="estado${linha["3"]}">
                        </td>
                        <td class="estado${linha["4"]}">
                        </td>
                        <td class="estado${linha["5"]}">
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <%}%>


            <% session.getAttribute("tabela2");%>
            <ul>
                <c:forEach items="${tabela2}" var="sala">
                    <li>${sala}</li>
                    </c:forEach>
            </ul>
        </div>

        <jsp:include page="../rodape.jsp" flush="false"></jsp:include>
    </body>
</html>
