<%@page import="PackageServlets.Carateristicas"%>
<%@page import="PackageServlets.UserDAO"%>
<%@page import="PackageServlets.SalaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script src="alteraSala.js"></script>
<div id="conteudo">
    <h1>Editar Sala</h1>
    <br>
    <br>
    <!--form action="action_page.php"-->
    <label>Selecione a sala a editar</label>
    <select id="sala">
        <%ArrayList salas = SalaDAO.getAllSalasImprimir();
            request.setAttribute("salas", salas);%>
        <c:forEach items="${salas}" var="sala">
            <option value="${sala["ID"]}">${sala["LOCALIZACAO"]}</option>
        </c:forEach>
    </select>
    <br>
    <h2>Novos valores:</h2>
    <div id="mensagem">
    </div>
    <div id="resultado"></div>
    <input type="button" value="Alterar" id="alterar">
</div>