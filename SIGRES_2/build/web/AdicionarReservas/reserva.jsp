<%@page import="java.util.HashMap"%>
<%@page import="PackageServlets.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" import="PackageServlets.UserBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%
    String sala = (String) session.getAttribute("sala");
    sala = sala == null ? "" : sala;
    String data = request.getParameter("data");
    session.setAttribute("data", data);
    data = data == null ? "" : data;
%>

<h4>Sala: <%= sala%></h4>
<h4>Dia: <%= data%></h4>
<form method="POST" action="../AdicionarReserva">
    <input type="checkbox" name="permanente"><label> Tornar está reserva permanente?</label>
    <br>

    <label>Hora início:</label>
    <select name="horaI">
        <option>8:30</option>
        <c:forEach var="i" begin="9" end="23">
            <option>${i}:30</option>
            <option>${i}:00</option>    
        </c:forEach>
    </select>
    <br>
    <label>Hora fim: </label>
    <select name="horaF">
        <c:forEach var="i" begin="9" end="23">
            <option>${i}:00</option>    
            <option>${i}:30</option>
        </c:forEach>
        <option>00:00</option>
    </select>
    <br>

    <label>Turma:</label>
    <input type="text" name="turma">
    <br>

    <label>Disciplina:</label>
    <input type="text" name="disciplina">
    <br>
    <p>Descrição:</p>
    <textarea name="desc"></textarea>
    <br>
    <input type="submit">
</form>