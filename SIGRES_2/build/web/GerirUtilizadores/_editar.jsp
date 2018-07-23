<%@page import="PackageServlets.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../jquery-1.11.3.min.js"></script>
<script src="alterarUser.js"></script>

<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">

<div id="conteudo">
    <h1>Editar Utilizadores</h1>
    <div id="mensagem"></div>
    <form>
        <label>Utilizador:</label>
        <% ArrayList valores = UserDAO.getUtilizadores();
            session.setAttribute("users", valores);
        %>
        <select id="user">
            <c:forEach items="${users}" var="user">
                <option value="${user["ID_UTILIZADOR"]}">
                    ${user["NOME"]}
                </option>
            </c:forEach>
        </select>
        <br>
        <div id="resultado"></div>
        <br>
        <input id="alterar" type="button" value="Confirmar">
    </form>
    <%if (session.getAttribute("msg") == null) {
            out.println("");
        } else {
            out.print(session.getAttribute("msg"));
            session.setAttribute("msg", null);
        }
    %>
</div>