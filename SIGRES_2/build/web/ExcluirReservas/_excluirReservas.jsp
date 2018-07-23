<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%@page import="PackageServlets.ReservaDAO"%>
<%@page import="PackageServlets.UserBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="PackageServlets.SalaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="conteudo">
    <h1>Excluir Reservas</h1>

    <div id="mensagem">
        <%
            try {
                boolean estado = (Boolean) session.getAttribute("estado");
                if (estado) {
                    out.print("Reserva(s) excluída(s) com sucesso!");
                } else {
                    out.print("Ocorreu um erro. Por favor tente novamente mais tarde");
                }
            } catch (Exception e) {
            }
        %>
    </div>
    <form action="../apagarReservas">
        <%
            UserBean user = (UserBean) session.getAttribute("currentSessionUser");

            ArrayList<HashMap> reservas = new ArrayList();
            try {
                if (user.getTipoUser() == 'R') {
                    reservas = (ArrayList) ReservaDAO.getReservasR(user);
                } else if (user.getTipoUser() == 'A') {
                    reservas = (ArrayList) ReservaDAO.getAllReservas();
                } else if (user.getTipoUser() == 'P') {
                    reservas = (ArrayList) ReservaDAO.getReservas(user);
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
                session.setAttribute("reservas", reservas);
            } catch (Exception e) {
            }

        %>
        <table id="tabela" style="width: 800px">
            <tr>
                <th>Apagar</th>
                <th>ID</th>
                <th>Sala</th>
                <th>Dia</th>
                <th>Hora Início</th>
                <th>Hora Fim</th>
                <th>Docente</th>
            </tr>
            <c:forEach items="${reservas}" var="reserva">
                <tr>
                    <td><input type="checkbox" name="${reserva["ID_RESERVA"]}"></td>
                    <td>${reserva["ID_RESERVA"]}</td>
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