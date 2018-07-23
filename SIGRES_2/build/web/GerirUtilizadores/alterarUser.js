$(document).ready(function () {
    $('#user').change(function (event) {
        var user = $('#user').val()
        $.post('EditarUser.jsp', {
            user: user
        }, function (responseText) {
            $('#resultado').html(responseText);
        });
    });
    $('#alterar').click(function (event) {
        var id = $("#user").val();
        var nome = $("#nome").val();
        var email = $("#email").val();
        var password = $("#password").val();
        var tipo_utilizador = $("#tipo_utilizador").val();
        $.post('../EditarUser', {
            id: id,
            nome: nome,
            email: email,
            password: password,
            tipo_utilizador: tipo_utilizador
        }, function (responseText) {
            $('#mensagem').html(responseText);
        });
    });
});