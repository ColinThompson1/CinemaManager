/**
 * Created by colinthompson on 2017-03-25.
 */



// Handlers =========================================

// Posting

$('#login-submit').click(function () {
    event.preventDefault(); //Don't trigger regular submit functionality

    var userEmail = $('#regEmail').val(); //Form values
    var pwd = $('#password').val();

    if (userEmail == "" ||pwd == "") {
        var $err = $('#loginError');
        $err.html("Your have left fields blank!")
        $err.show();
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

$('#register-submit').click(function () {
    event.preventDefault(); //Don't trigger regular submit functionality

    //Grab form values
    var fName = $('#fname').val();
    var lName = $('#lname').val();
    var bday = $('#bday').val();
    var gender = $('#genderInput').val();
    var email = $('#reg-email').val();
    var pwd = $('#reg-password').val();
    var cfm = $('#confirm-password').val();


    if (fName == "" ||lName == "" ||bday == "" ||gender == "" ||email == "" ||pwd == "" ||cfm == "") {
        var $err = $('#registerError');
        $err.html("At least one field has been left blank");
        $err.show();

    } else if (pwd != cfm) {
        var $err = $('#registerError');
        $err.html("Your password fields do not match!");
        $err.show();
    } else {
        $.ajax({
            type:'POST',
            url:'register',
            data: {
                email: email,
                password: pwd,
                fname: fName,
                lname: lName,
                bday: bday,
                sex: gender
            },
            dataType: "json",
            xhrFields: {
                withCredentials: true
            },
            success: function (data, textStatus) {

                if (data.refresh) {
                    location.reload();
                } else {
                    var $errLog = $('#registerError');
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

