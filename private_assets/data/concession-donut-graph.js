/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'concession-donut-data',
        dataType: 'json',
        success: function (data, textStatus) {
            new Morris.Donut({
                element: 'popular-snacks-graph',
                data: data,
                resize: true
            });

        }
    });


});