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
            success: function (data, textStatus) {

                if (data.flashInfo) //Check for alert to display
                    alert("Error: " + data.flashInfo);
                else
                    alert("Unknown login error occurred"); //if there is no alert the page should have redirected you

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

