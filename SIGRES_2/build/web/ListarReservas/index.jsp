<%@page import="java.util.HashMap"%>
<%@page import="PackageServlets.ReservaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PackageServlets.UserBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../style.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Reservas</title>
    </head>
    <body>
        <div id="conteudo">
            <h1>Listar Reservas</h1>
            <br>
            <br>
            <%
                UserBean user = (UserBean) session.getAttribute("currentSessionUser");

                ArrayList<HashMap> reservas = new ArrayList();
                try {

                    reservas = (ArrayList) ReservaDAO.getAllReservas();
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
            <table id="tabela">
                <tr>
                    <th>ID</th>
                    <th>Sala</th>
                    <th>Dia</th>
                    <th>Hora Início</th>
                    <th>Hora Fim</th>
                    <th>Docente</th>
                </tr>
                <c:forEach items="${reservas}" var="reserva">
                    <tr>
                        <td>${reserva["ID_RESERVA"]}</td>
                        <td>${reserva["LOCALIZACAO"]}</td>
                        <td>${reserva["DIA"]}</td>
                        <td>${reserva["HORA_INICIO"]}</td>
                        <td>${reserva["HORA_FIM"]}</td>
                        <td>${reserva["NOME"]}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>