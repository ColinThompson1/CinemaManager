/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'ages-graph',
        dataType: 'json',
        success: function (data, textStatus) {
            console.log(data);
            new Morris.Donut({
                element: 'ages-graph',
                data: data,
                resize: true
            });

        }
    });

});
