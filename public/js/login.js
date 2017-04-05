/**
 * Created by colinthompson on 2017-03-25.
 */



// Handlers =========================================

// Posting

$('#login-submit').click(function () {
    event.preventDefault(); //Don't trigger regular submit functionality

    var userEmail = $('#regEmail').val(); //Form values
    var pwd = $('#password').val();

    if (email == "" ||pwd == "") {
        alert("Your email or password is empty");
    } else {
        $.ajax({
            type:'POST',
            url:'userlogin',
            data: {
                email: userEmail,
                password: pwd
            },
            dataType: "json",
            xhrFields: {
                withCredentials: true
            },
            success: function (data, textStatus) {

                if (data.refresh) {
                    location.reload();
                } else {
                    var $errLog = $('#loginError');
                    $errLog.html(data.flashInfo);
                    $errLog.show();

                }

            }

        });

    }
    return false;
});


// Swapping between Login/Register

$('#login-form-link').click(function(e) {
    $("#login-form").delay(100).fadeIn(100);
    $("#register-form").fadeOut(100);
    $('#register-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
});
$('#register-form-link').click(function(e) {
    $("#register-form").delay(100).fadeIn(100);
    $("#login-form").fadeOut(100);
    $('#login-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
});

//Don't let values go empty

// Datepicker =========================================

$('#bday').datepicker({
    format: 'mm/dd/yyyy',
    showOtherMonths: true,
    selectOtherMonths: true,
    autoclose: true,
    changeMonth: true,
    changeYear: true,
    orientation: "bottom"
});

