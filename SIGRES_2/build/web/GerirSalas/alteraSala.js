$(document).ready(function () {
    $('#alterar').click(function (e) {
        var id = $('#sala').val();
        var nome = $('#sala option:selected').text();
        var responsavel = $('#responsavel').val();
        
        var valores = $('.edit').toArray();
        var valoresApassar = {};
        valores.forEach(function(i, index) {
            if(i.type == "checkbox")
                valoresApassar[i.id] = i.checked;
            else valoresApassar[i.id] = i.value;
        });
        valoresApassar = JSON.stringify(valoresApassar);
        
        $.post('../EditarSala', {
            valores: valoresApassar,
            salaId: id,
            salaNome: nome,
            responsavel: responsavel
        }, function (responseText) {
            $('#mensagem').html(responseText);
        });
    })
    
    $('#sala').change(function (event) {
        var name = $('#sala').val();
        $.post('../EditarSalaJsp', {
            sala: name
        }, function (responseText) {
            $('#resultado').html(responseText);
        });
    });
});