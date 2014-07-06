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

    $('.carousel').on("click", "#button", function(event) {
        console.log(event.target.href);
        event.preventDefault();
        console.log("this is after the click of title");
        var str = $('#title').serialize();
        console.log(str);
        // var target = event.target.href;
        console.log(event.currentTarget.form.action);
        $.ajax({
            url: event.currentTarget.form.action,
            type: 'POST',
            data: str,
            success: (function() {
                console.log("success");
                moveOn();
                console.log($('.fill > form')[1]);
                $('.fill > form')[0].reset();
                $('.fill > form')[1].reset();
                $('.fill > form')[2].reset();
            })
        });
    });


    $('.carousel').on("click", "#first_question", function(event) {
        event.preventDefault();
        console.log("this is after the click");
        var str = $('#question1').serialize();
        console.log(str);
        var target = event.target.href;
        console.log(event.currentTarget.form.action);
        $.ajax({
            url: event.currentTarget.form.action,
            type: 'POST',
            data: str,
            success: (function() {
                console.log("success");
                moveOn();
                console.log($('.fill > form')[1]);
                $('.fill > form')[0].reset();
                $('.fill > form')[1].reset();
                $('.fill > form')[2].reset();
            })
        });
    });

    $('.carousel').on("click", "#second_question", function(event) {
        event.preventDefault();
        console.log("this is after the click");
        var str = $('#question2').serialize();
        console.log(str);
        var target = event.target.href;
        console.log(event.currentTarget.form.action);
        $.ajax({
            url: event.currentTarget.form.action,
            type: 'POST',
            data: str,
            success: (function() {
                console.log("success");
                moveOn();
                console.log($('.fill > form')[1]);
                $('.fill > form')[0].reset();
                $('.fill > form')[1].reset();
                $('.fill > form')[2].reset();
            })
        });
    });
});
