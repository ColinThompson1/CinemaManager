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
            for (var i = 0; i < data.cust.length; i++) {
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
            for (var i = 0; i < data.emp.length; i++) {
                var u = data.emp[i];
                $('#emp-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.ssn + "</td>" +
                    "<td>" + u.fName + "</td>" +
                    "<td>" + u.lName + "</td>" +
                    "<td>" + u.bDay + "</td>" +
                    "<td>" + u.dept + "</td>" +
                    "<td>" + u.sex + "</td>" +
                    "<td>" + u.address + "</td>" +
                    "<td>" + u.phone + "</td>" +
                    "<td>" + u.salary + "</td>" +
                    "<td>" + u.email + "</td>" +
                    "</tr>"
                )
            }

            for (var i = 0; i < data.adv.length; i++) {
                var u = data.adv[i];
                $('#adv-lookup-body').append(
                    "<tr>" +
                    "<td>" + u.id + "</td>" +
                    "<td>" + u.company + "</td>" +
                    "<td>" + u.name + "</td>" +
                    "<td>" + u.email + "</td>" +
                    "<td>" + u.phone + "</td>" +
                    "</tr>"
                )
            }

            $('#customer-lookup').DataTable({
                responsive: true
            });

            $('#employee-lookup').DataTable({
                responsive: true
            });

            $('#advertiser-lookup').DataTable({
                responsive: true
            });
        }
    });

});