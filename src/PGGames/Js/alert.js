function showalert(message) {
    $("#alertbox").modal({
        "backdrop": "static",
        "keyboard": true,
        "show": true
    });
    $("#mensajePer").append(message);
}

function hide() {
    $("#ddlTipo").removeAttr("required");
    $("#esconder").hide();
}

function resize() {
    $("#adaptable").toggleClass("col-md-8");
    $("#adaptable").toggleClass("col-md-12");
}

function asigURL(url) {
    console.log(url);
    $("#btAceptar").attr("onclick", "redirect('" + url + "')");
}

function redirect(url) {
    window.location = url;
}

