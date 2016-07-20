window.onload = function() {

    //Params
    var scriptPram = document.getElementById('load_widget');
    var id = scriptPram.getAttribute('data-page');

    //iFrame
    var iframe = document.createElement('iframe');
    iframe.style.display = "none";
    iframe.src = "embed/" + id;
    document.body.appendChild(iframe);
};