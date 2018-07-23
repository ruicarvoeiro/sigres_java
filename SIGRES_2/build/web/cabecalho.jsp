<%@page import="java.util.Calendar"%>
<%@page import="PackageServlets.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%
    Object valor = session.getAttribute("loginOK");
    if (valor == null) {
        response.sendRedirect("login.jsp");
    }
%>
<div id="header">
    <img id="titulo" src="../img/titulo5.png" height="60" width="850" alt="SiGREs">
    <div id="utilizador">
        <%UserBean user = (UserBean) session.getAttribute("currentSessionUser");
            String nome;
            String saudacao;
            try {
                nome = user.getNome();
                int horas = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);

                if (horas >= 0 && horas < 12) {
                    saudacao = "Bom dia, ";
                } else if (horas >= 12 && horas < 17) {
                    saudacao = "Boa tarde, ";
                } else {
                    saudacao = "Boa noite, ";
                }
            } catch (Exception e) {
                saudacao = "Olá, ";
                nome = "utilizador";
            }

            out.print(saudacao + nome);
        %>
    </div>
    <form action="../logout" id="logout">
        <input type="submit" value="Logout">
    </form>
    <div id="logo"></div>
    <div id="areaMenu">
        <%
            char tipo;
            try{
                tipo = user.getTipoUser();
            }catch(Exception e){
                tipo = 'Z';
            }
            if (tipo == 'P') { %>
        <%@include file="Menus/menuProf.jsp" %>
        <% } else if (tipo == 'R') { %>
        <%@include file="Menus/menuResp.jsp" %>
        <% } else if (tipo == 'A') { %>
        <%@include file="Menus/menuAdmin.jsp" %>
        <% } else if (tipo == 'F') { %>
        <%@include file="Menus/menuFunc.jsp" %>
        <%}%>
    </div>
</div>