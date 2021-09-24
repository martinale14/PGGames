function showInfo() {

    $("#infoCuenta").show();
    $("#seguridad").hide();
    $("#info").addClass("active");
    $("#seg").removeClass("active");
}

function showSeguridad() {
    $("#infoCuenta").hide();
    $("#seguridad").show();
    $("#info").removeClass("active");
    $("#seg").addClass("active");
}