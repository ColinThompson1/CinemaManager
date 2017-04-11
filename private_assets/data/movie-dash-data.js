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
    });

});