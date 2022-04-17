window.addEventListener('load', function() {
    console.log('Roda OffDuty loaded');
});

window.addEventListener('message', function(event) {
    var v = event.data

    switch (v.action) {
        case 'OpenMenu': 
            $('.titulo').text(v.title);
            $('.parrafo').text(`Welcome ${v.name}, ¿What do you want to do?`)
            $('.rightSide img').attr('src', v.img);
            $('.entrar').attr('id', v.job)
            $('.salir').attr('id', v.offjob)
            $('.rango').attr('id', v.grado)
            $('.container').show()

        break;
    }
})


$(function(){
    $('.entrar').click(function(){
        $.post('https://Roda_OffDuty/setJob', JSON.stringify({
            job: $(this).attr('id'),
            grade: $('.rango').attr('id')
        }));
        CloseAll()
    })

    $('.salir').click(function(){
        $.post('https://Roda_OffDuty/setJob', JSON.stringify({
            job: $(this).attr('id'),
            grade: $('.rango').attr('id')
        }));
        CloseAll()
    })
})

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});

function CloseAll(){
    $('.container').fadeOut(500);
    $.post('https://Roda_OffDuty/exit', JSON.stringify({}));
}