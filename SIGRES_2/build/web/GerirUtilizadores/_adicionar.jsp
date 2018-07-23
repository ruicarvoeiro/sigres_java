<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<div id="conteudo">
    <h1>Adicionar Utilizadores</h1>
    <br>
    <br>
    <form method="POST" action = "../AdicionarUser">
        <label>Nome:</label><input type="text" name="nome"><br/>
        <label>E-mail:</label><input type="email" name="email"><br/>
        <label>Password:</label><input type="text" name="password"><br/>
        <label>Privilégios:</label>
        <select name="tipo_utilizador">
            <option value="Administrador">Administrador</option>
            <option value="ResponsavelSala">Responsavel Sala</option>
            <option value="Professor">Professor</option>
            <option value="Funcionario">Funcionário</option>
        </select><br>
        <br>
        <input type="submit" value="Confirmar">
    </form>
    <%if (session.getAttribute("msg") == null) {
            out.println("");
        } else {
            out.print(session.getAttribute("msg"));
            session.setAttribute("msg", null);
        }
    %>
</div>