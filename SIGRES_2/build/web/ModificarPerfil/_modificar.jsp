<%@page import="PackageServlets.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PackageServlets.UserBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="conteudo">
    <h1>Modificar Perfil</h1>


    <form method="POST" action="../modificarPerfil">
        <%if (session.getAttribute("msg") == null) {
                out.println("");
            } else {
                out.print(session.getAttribute("msg"));
                session.setAttribute("msg", null);
            }
        %>
        <label>Nome:</label>
        <input type="text" name="nome">
        <br>
        <label>E-mail:</label>
        <input type="email" name="email">
        <br>
        <label>Password:</label>
        <input type="text" name="password">
        <br>
        <br>
        <input type="submit" value="Confirmar">
    </form>


</div>