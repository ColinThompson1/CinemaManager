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
                barColors: ['#5CB85C', '#447604', '#6CC551', '#9FFCDF', '#52AD9C', '#47624F'], //todo mix up the colours a bit
                hideHover: true,
                xLabelAngle: 40,
                resize: true
            });

            $('svg').height(380);

        }
    });

    $(window).resize(function () {
        setTimeout(function () {
            $('svg').height(380);
        }, 2000)

    })


});