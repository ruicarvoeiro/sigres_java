<%@page import="java.util.ArrayList"%>
<%@page import="PackageServlets.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="../jquery-1.11.3.min.js"></script>
<script src="apagarUser.js"></script>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!DOCTYPE html>
<div id="conteudo">
    <h1>Gerir Utilizadores</h1>
    <br>
    <br>
    <h2>Excluir Utilizadores</h2>
    <div id="mensagem"></div>
    <form>
    <%
        ArrayList users = UserDAO.getUtilizadores();
        request.setAttribute("users", users);
    %>
    <c:forEach items="${users}" var="user">
        <label>${user.get("NOME")}</label>
        <input value="${user["ID_UTILIZADOR"]}" type="checkbox" class="users"><br>
    </c:forEach>
        <input type="button" id="apagar" value="Apagar">
    </form>
</div>