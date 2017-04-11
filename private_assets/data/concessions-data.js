/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'concession-dashboard',
        dataType: 'json',
        success: function (data, textStatus) {
            console.log(data);
            for (var i = 0; i < data.conc.length; i++) {
                var u = data.conc[i];
                $('#conce-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.sku + "</td>" +
                    "<td>" + u.item + "</td>" +
                    "<td>" + u.price + "</td>" +
                    "<td>" + u.quantity + "</td>" +
                    "<td>" + u.ordered + "</td>" +
                    "<td>" + u.barcode + "</td>" +
                    "</tr>"
                )
            }
            $('#conce-lookup').DataTable({
                responsive: true,
                createdRow: function (row, data, dataIndex) { //Colour inventory if it is about to run out
                    var d = data[3];
                    if (d < 800)
                        $(row).addClass('warning');
                    else if (d < 500)
                        $(row).addClass('danger');

                }
            });
        }
    });



});