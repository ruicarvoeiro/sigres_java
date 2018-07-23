$(document).ready(function () {
    $('#apagar').click(function (event) {
        var valores = [];
        $(".users:checked").each(function (){
            valores.push($(this).val());
        });
        valores = JSON.stringify(valores);
        $.post('../ApagarUser', {
            valores: valores
        }, function (responseText) {
            $('#mensagem').html(responseText);
        });
    });
});