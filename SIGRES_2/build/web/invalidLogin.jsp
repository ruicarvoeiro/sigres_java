<%@ page language="java" 
         contentType="text/html; charset=utf-8"
         %>

<html>

    <head>
        <link rel="stylesheet" type="text/css" href="../style.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <meta http-equiv="Content-Type" 
              content="text/html; charset=windows-1256">
        <title>Invalid Login</title>
    </head>

    <body>
    <center>
        <h1>Erro:
            <% out.print(session.getAttribute("erroLogin"));%>
        </h1>
    </center>
</body>

</html>