/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'movie-dashboard',
        dataType: 'json',
        success: function (data, textStatus) {
            console.log(data);
            for (var i = 0; i < data.movie.length; i++) {
                var u = data.movie[i];
                $('#movie-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.title + "</td>" +
                    "<td>" + u.release + "</td>" +
                    "<td>" + u.length + "</td>" +
                    "<td>" + u.earnings + "</td>" +
                    "<td>" + u.airLength + "</td>" +
                    "</tr>"
                )
            }
            for (var i = 0; i < data.ticket.length; i++) {
                var u = data.ticket[i];
                $('#ticket-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.movie + "</td>" +
                    "<td>" + u.fName + "</td>" +
                    "<td>" + u.lName + "</td>" +
                    "<td>" + u.seat + "</td>" +
                    "</tr>"
                )
            }

            for (var i = 0; i < data.showing.length; i++) {
                var u = data.showing[i];
                $('#showing-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.movie + "</td>" +
                    "<td>" + u.start + "</td>" +
                    "<td>" + u.price + "</td>" +
                    "<td>" + u.aud + "</td>" +
                    "</tr>"
                )
            }

            for (var i = 0; i < data.aud.length; i++) {
                var u = data.aud[i];
                $('#aud-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.seatCount + "</td>" +
                    "</tr>"
                )
            }

            $('#movie-lookup').DataTable({
                responsive: true
            });

            $('#showing-lookup').DataTable({
                responsive: true
            });

            $('#ticket-lookup').DataTable({
                responsive: true
            });

            $('#aud-lookup').DataTable({
                responsive: true
            });
        }
    })
    
    $('#show-add-movie').click(function () {
        $('#add-movie').toggle();
    });
    
    $('#add-movie-btn').click(function () {

        var m = {
                title: $('#mov-title').val(),
                release: $('#mov-release').val(),
                length: $('#mov-length').val(),
                earning:$('#mov-earning').val(),
                air_length: $('#mov-air_length').val(),
                img_link: $('#mov-img_link').val()
            };

        if (!m.title || !m.release || !m.length || !m.earning || !m.air_length || !m.img_link) {
            var $err = $('#movie-add-error');
            $err.html("At least one value was left blank");
            $err.show();

        } else {
            $.ajax({
                type: 'POST',
                url: 'add-movie',
                data: m,
                dataType: 'json',
                xhrFields: {
                    withCredentials: true
                },
                success: function (data, textStatus) {
                    if (data.err) { //error

                        var $err = $('#movie-add-error');
                        $err.html(data.msg);
                        $err.show();

                    } else {
                        alert("Success!")
                    }
                }
            });
        }

        
    });

    $('#show-add-showing').click(function () {
        $('#add-showing').toggle();
    });

    $('#add-show-btn').click(function () {

        var m = {
            movid: $('#show-movid').val(),
            start: $('#show-start').val(),
            price: $('#show-price').val(),
            aud:$('#show-aud').val()
        };

        if (!m.movid || !m.start || !m.price || !m.aud) {
            var $err = $('#show-add-error');
            $err.html("At least one value was left blank");
            $err.show();

        } else {
            $.ajax({
                type: 'POST',
                url: 'add-showing',
                data: m,
                dataType: 'json',
                xhrFields: {
                    withCredentials: true
                },
                success: function (data, textStatus) {
                    if (data.err) { //error

                        var $err = $('show-add-error');
                        $err.html(data.msg);
                        $err.show();

                    } else {
                        alert("Success!")
                    }
                }
            });
        }


    });

});