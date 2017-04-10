/**
 * Created by colinthompson on 2017-04-10.
 * Decoupled so that we can easily reference on certain pages
 */
$().ready(function () {

    $.ajax({
        method: 'POST',
        url: 'user-dashboard',
        dataType: 'json',
        success: function (data, textStatus) {
            console.log(data);
            for (var i = 0; i < data.cust; i++) {
                var u = data.cust[i];
                $('#cust-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.fName + "</td>" +
                    "<td>" + u.lName + "</td>" +
                    "<td>" + u.bDay + "</td>" +
                    "<td>" + u.sex + "</td>" +
                    "<td>" + u.address + "</td>" +
                    "<td>" + u.credit + "</td>" +
                    "<td>" + u.email + "</td>" +
                    "<td>" + u.phone + "</td>" +
                    "</tr>"
                )

            }

        }
    });

});