function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validatePasswordNum(password) {
    var re = /\d+/;
    return re.test(password);
}

$(function() {
console.log("hello");
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validatePasswordNum(password) {
    var re = /\d+/;
    return re.test(password);
}
});

$(function() {
console.log("hello");
$('[name="sign_up"]').submit(function(event) {
    console.log($(':input')[0]);
    console.log("button click");
    var email = event.target.email.value;
    var password = event.target.password.value;
    console.log(password);
    if (validateEmail(email) === false) {
        event.preventDefault();
        $('#errors').append("<li>Must be a valid email address</li>");
    }

    if (password.length < 8) {
        event.preventDefault();
        console.log("after password length if statement");
        $('#errors').append("<li>Password must be at least 8 characters long</li>");
    }

    if (password.toLowerCase() === password) {
        event.preventDefault();
        $('#errors').append("<li>Password must have at least one capital letter</li>");
    }

    if (validatePasswordNum(password) === false) {
        event.preventDefault();
        $('#errors').append("<li>Password must have at least one numeric value</li>");
    }
  });

$('[name="log_in"]').submit(function(event) {
    console.log("Hello, before event handler stopper");
    event.preventDefault();
    console.log($(':input')[0]);
    console.log("button click");
    $.ajax({
        url: '/login',
        type: 'POST',
        dataType: 'string',
        data: $('form').serialize(),
    }).fail(function(response){
      console.log(response);
      $('#errors').append("<li>" + response.responseText +"</li>");
});
console.log("after ajax");

});
});
