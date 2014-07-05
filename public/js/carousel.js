$(function() {
    var moveOn = function() {
        if ($('.frames').css('margin-left') <= '-1180' + 'px') {
            console.log("before after statement");
            $('.frames').css('margin-left', '-590' + 'px');
            $("li #cell:last-child").after($('li #cell:first-child'));
        }

        var value = ($('.frames').css('margin-left'));
        value = parseInt(value.slice(0, -2));
        $('.frames').animate({
            marginLeft: value - 590 + 'px'
        }, 300);

    };


    $('.carousel').on("click", "#next_question", function(event) {
        event.preventDefault();
        console.log("this is after the click");
        var str = $('form').serialize();
        var target = event.target.href;
        console.log("before ajax call");
        $.ajax({
            url: target,
            type: 'POST',
            data: str,
            success: (function() {
                console.log("success");
                moveOn();
                $('.fill > form')[0].reset();
                $('.fill > form')[1].reset();
            })
        });
    });
});
