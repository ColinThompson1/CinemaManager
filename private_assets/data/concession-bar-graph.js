/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'concession-bar-data',
        dataType: 'json',
        success: function (data, textStatus) {
            new Morris.Bar({

                element: 'concgraph',
                data: data,
                xkey: 'Item',
                ykeys: ['Quantity'],
                labels: ['Quantity'],
                barColors: ['#BFD7EA'],
                hideHover: true,
                xLabelAngle: 40,
                resize: true
            });

            $('svg').height(380);

        }
    });


});
