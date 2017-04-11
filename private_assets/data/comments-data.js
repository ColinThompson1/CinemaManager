/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'comments-dashboard',
        dataType: 'json',
        success: function (data, textStatus) {
            console.log(data);
            for (var i = 0; i < data.com.length; i++) {
                var u = data.com[i];
                $('#com-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.movie + "</td>" +
                    "<td>" + u.rating + "</td>" +
                    "<td>" + u.comment + "</td>" +
                    "</tr>"
                )
            }

            $('#com-lookup').DataTable({
                responsive: true,
                createdRow: function (row, data, dataIndex) { //Colour inventory if it is about to run out
                    var d = data[2];
                    if (d < 5)
                        $(row).addClass('warning');
                    else if (d < 3)
                        $(row).addClass('danger');

                }
            });
        }
    });



});