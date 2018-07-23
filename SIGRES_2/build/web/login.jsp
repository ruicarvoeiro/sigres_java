<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sigres</title>
        <link href="https://fonts.googleapis.com/css?family=Lato|Ubuntu" rel="stylesheet"> 
        <link rel="stylesheet" type="text/css" href="/style_login.css">
        <link rel="stylesheet" type="text/css" href="/style.css">
        <meta charset="utf-8">
        <meta lang="pt">
    </head>
    <body>
        <div id="background-image"></div>
        <div id="areaLogin"<% out.print(session.getAttribute("loginOK") == "false" ? " class='erroLogin'" : ""); %>>
            <div id="logotipo">
                <img src="img/logo.jpg">
            </div>

            <div id="titulo">
                <h4>Bem vindo ao site de reservas do IPSantarém</h4>
            </div>
            <form action="Login" method="POST" id="form">
                <input type="text" name="email" id="email" placeholder="Email">
                <br>

                <input type="password" name="pass" id="password" placeholder="Password">
                <br>
                <p>
                    <% out.print(session.getAttribute("loginOK") == "false"
                            ? "<span>Email ou Palavra-passe incorretos<span><br><a href=''>Esqueceu-se da sua palavra passe?</a>" : "");%>
                </p>
                <input type="submit" id="entrar" value="Login">
            </form>
            <div id="clear"></div>
        </div>
    </body>
</html>