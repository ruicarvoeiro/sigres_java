/*$(function empty() {
    var valor = $('input[type=date]').val;
    if (valor == "")
        $(this).val(new Date(Date.now()).toLocaleString());
    alert($(this).val());
});*/
function isValidDate(s) {
  var bits = s.split('/');
  var d = new Date(bits[2], bits[1] - 1, bits[0]);
  return d && (d.getMonth() + 1) == bits[1];
} 
function empty() {
    var x;
    x = document.getElementById("datepicker").value;
    var strData = x;
    var partesData = strData.split("/");
    var data = new Date(partesData[2], partesData[1] - 1, partesData[0]);
    
    if (x == "" || !isValidDate(x) || data <= new Date()) {
        alert("Data inválida");
        return false;
    };
}