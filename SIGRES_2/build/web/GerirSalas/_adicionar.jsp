<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%@page import="PackageServlets.Carateristicas"%>
<%@page import="PackageServlets.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<div id="conteudo">
    <script src="adicionarSala.js"></script>
    <h1>Adicionar Sala</h1>
    <br>
    <br>
    <div id="mensagem"></div>

    <label>Nome sala (localização):</label>
    <input type="text" id="localizacao"><br>

    <label>Responsável:</label>
    <select id="responsavel">
        <%ArrayList responsaveis = UserDAO.getResponsavel();
                request.setAttribute("resp", responsaveis);%>
        <c:forEach items="${resp}" var="responsavel">
            <option value="${responsavel.get("ID_UTILIZADOR")}">${responsavel.get("NOME")}</option>
        </c:forEach>
    </select><br>
    <%
        ArrayList lista = (ArrayList) Carateristicas.get();
        session.setAttribute("lista", lista);
    %>
    <c:forEach items="${lista}" var="carateristica">
        <label>${carateristica['NOME']}</label>
        <c:choose>
            <c:when test="${carateristica['SOFTWARE']=='1'}">
                <input class="car" type="checkbox" name="${carateristica['NOME']}">
            </c:when>    
            <c:otherwise>
                <input type="number"  class="car" name="${carateristica['NOME']}" value=0>
            </c:otherwise>
        </c:choose>
        <br>
    </c:forEach>
    <input type="button" id="adiciona" value="Confirmar">

</div>