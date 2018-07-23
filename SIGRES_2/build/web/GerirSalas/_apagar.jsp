<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%@page import="PackageServlets.SalaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="conteudo">
    <h1>Apagar Salas</h1>
    <br>
    <br>
    <form method="POST" action="../ApagarSala">
        <label>Selecione a sala a apagar:</label>
        <select name="sala">
            <%ArrayList salas = SalaDAO.getAllSalasImprimir();
                request.setAttribute("salas", salas);%>
            <c:forEach items="${salas}" var="sala">
                <option value="${sala["ID"]}">${sala["LOCALIZACAO"]}</option>
            </c:forEach>
        </select>
        <br>
        <input type="submit" value="Excluir">

        <div id="mensagem">
            <%
                String mensagem = (String) session.getAttribute("msg");
                if (mensagem != null) {
                    out.print(mensagem);
                }
                session.setAttribute("msg", null);
            %>
        </div>
    </form>
</div>