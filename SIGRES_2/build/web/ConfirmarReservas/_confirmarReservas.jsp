<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PackageServlets.UserBean"%>
<%@page import="PackageServlets.ReservaDAO"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="conteudo">
<h1>Confirmar Reservas</h1>
<%
    UserBean user = (UserBean) session.getAttribute("currentSessionUser");
    ArrayList<HashMap> reservas = new ArrayList();
    try {
        if (user.getTipoUser() == 'R') {
            reservas = (ArrayList<HashMap>) ReservaDAO.getReservasPendentes(user);
        } else if (user.getTipoUser() == 'A') {
            reservas = (ArrayList<HashMap>) ReservaDAO.getReservasPendentes();
        } else {
            response.sendRedirect("index.jsp");
        }

        for (int i = 0; i < reservas.size(); i++) {
            String dia = (String) reservas.get(i).get("DIA");
            if (dia == "" || dia == null) {
                dia = (String) reservas.get(i).get("DIA_SEMANA");
            } else {
                dia = dia.substring(0, 10);
            }

            reservas.get(i).put("DIA", dia);
        }
    } catch (Exception e) {
    }

    session.setAttribute("reservas", reservas);
%>

<div id="mensagem">
    <%
        try {
            boolean estado = (Boolean) session.getAttribute("estado");
            if (estado) {
                out.print("Reserva(s) confirmada(s) com sucesso!");
            } else {
                out.print("Ocorreu um erro. Por favor tente novamente mais tarde");
            }
        } catch (Exception e) {
        }
    %>
</div>

<form action="../confirmarReservas">
    <table>
        <tr>
            <th>Confirmar</th>
            <th>Sala</th>
            <th>Dia</th>
            <th>Hora Início</th>
            <th>Hora Fim</th>
            <th>Docente</th>
        </tr>
        <c:forEach items="${reservas}" var="reserva">
            <tr>
                <td><input name="${reserva["ID_RESERVA"]}" type="checkbox"></td>
                <td>${reserva["LOCALIZACAO"]}</td>
                <td>${reserva["DIA"]}</td>
                <td>${reserva["HORA_INICIO"]}</td>
                <td>${reserva["HORA_FIM"]}</td>
                <td>${reserva["NOME"]}</td>
            </tr>
        </c:forEach>
    </table>
    <input type="submit">
</form>
</div>