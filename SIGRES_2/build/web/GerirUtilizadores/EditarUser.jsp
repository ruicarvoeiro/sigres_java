<%@page import="java.util.HashMap"%>
<%@page import="PackageServlets.UserDAO"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<%
    int idUtilizador = Integer.parseInt(request.getParameter("user"));
    HashMap valores = UserDAO.getDadosUser(idUtilizador);
%>

<label>Nome:</label>
<input type="text" id="nome" value="<%=valores.get("NOME")%>"><br>

<label>E-mail:</label>
<input type="email" id="email" value="<%=valores.get("EMAIL")%>"><br/>

<label>Password:</label>
<input type="text" id="password" value="<%=valores.get("PALAVRA_PASSE")%>"><br>

<label>Privilégios:</label>
<select id="tipo_utilizador">
    <option value="Administrador" <%= (valores.get("TIPO_USER").equals("A") ? " selected=\"selected\"" : "")%>>Administrador</option>
    <option value="ResponsavelSala" <%= (valores.get("TIPO_USER").equals("R") ? "selected=\"selected\"" : "")%>>Responsavel Sala</option>
    <option value="Professor" <%= (valores.get("TIPO_USER").equals("P") ? "selected=\"selected\"" : "")%>>Professor</option>
    <option value="Funcionario" <%= (valores.get("TIPO_USER").equals("F") ? "selected=\"selected\"" : "")%>>Funcionário</option>
</select>
<br>