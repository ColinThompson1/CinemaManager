/**
 * Created by colinthompson on 2017-04-08.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    console.log($('#morris-donut-chart').val());

    $.ajax({
        method: 'POST',
        url: 'popularity-graph-data',
        dataType: 'json',
        success: function (ticketSales, textStatus) {
            new Morris.Donut({
                element: 'popularity-graph',
                data: ticketSales,
                resize: true
            });

        }
    })

});