/**
 * Created by colinthompson on 2017-04-08.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'rev-time-graph-data',
        dataType: 'json',
        success: function (movieRev, textStatus) {
            new Morris.Bar({

                element: 'movierevgraph',
                data: movieRev,
                xkey: 'Title',
                ykeys: ['Revenue'],
                labels: ['Revenue'],
                hideHover: true,
                resize: true,
                xLabelAngle: 35
            });

            $('svg').height(380);

        }
    })

});