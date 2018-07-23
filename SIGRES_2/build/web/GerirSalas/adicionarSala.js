$(document).ready(function () {
    $('#adiciona').click(function (e) {
        localizacao = $('#localizacao').val();
        responsavel = $('#responsavel').val();
        var valores = $('.car').toArray();
        var valoresApassar = {};
        valores.forEach(function(i, index) {
            if(i.type == "checkbox")
                valoresApassar[i.name] = i.checked;
            else valoresApassar[i.name] = i.value;
        });
        valoresApassar = JSON.stringify(valoresApassar);
        $.post('../AdicionarSala', {
            localizacao: localizacao,
            responsavel: responsavel,
            carateristicas: valoresApassar
        }, function (responseText) {
            $('#mensagem').html(responseText);
        });
    });
});