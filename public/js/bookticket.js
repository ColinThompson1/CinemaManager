/**
 * Created by Mark.Lin on 4/10/2017.
 */

$('#book-ticket').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var movieID = button.data('title') // Extract info from data-* attributes

    $.post('bookmovie', {movieID: movieID})
        .done(function(res){

            $('#movieName').text(res.TITLE);
            $('#movieThumbnail').attr("src", res.POSTER_PATH)
            $('#movieSummary').text(res.SUMMARY);
            $('#buyTicket').data("id", movieID);

            $.post('movieReview', {movieID: res.ID})
                .done(function(rev){

                    $('#movieReview').empty()
                    for(var i=0; i < rev.length; i++)
                        $('#movieReview').append('<hr>' + '<p>' +rev[i].CONTENT + '</p>' + '<p>Rating:' + rev[i].RATING+'/10</p>');
                })
                .fail(function(){
                    alert("Could not grab reviews")
                });

        })
        .fail(function(){
            alert("error");
        });
});

$('#buyTicket').click(function (){
   movieID = $(this).data('id')

   $.post('getShowing', {movieID: movieID})
       .done(function(res){
           alert("Ticket booked! \n\t Start time: " + res.START_TIME + " \n\t Price: $" + res.PRICE + " \n\t Auditorium: " + res.AUD_ID + " \n\t Seat: " + res.SEAT);
       })
       .fail(function(){
           alert("Unable to book ticket")
       });




});