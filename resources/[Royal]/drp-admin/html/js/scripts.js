window.addEventListener('message', function(event) {
    if (event.data.type == 'open') {
        $('#adminmenu').fadeIn('fast')
    }
    if (event.data.type == 'close') {
        $('#adminmenu').fadeOut('fast')
    }
})

document.onkeydown = function(evt) {
    evt = evt || window.event;
    var isEscape = false;
    if ("key" in evt) {
        isEscape = (evt.key === "Escape" || evt.key === "Esc");
    } else {
        isEscape = (evt.keyCode === 27);
    }
    if (isEscape) {
      $('#adminmenu').fadeOut('fast');
      $.post('https://drp-admin/close');
    }
}

function pressButton(data) {
    $.post('https://drp-admin/buttonpress', JSON.stringify({id: data}));
}