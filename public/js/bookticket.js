/**
 * Created by Mark.Lin on 4/10/2017.
 */

$('#book-ticket').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var movieName = button.data('title') // Extract info from data-* attributes

    $.post('bookmovie', {movieTitle: movieName})
        .done(function(res){

            $('#movieName').text(res.TITLE);
            $('#movieSummary').text(res.TITLE);
            $('#movieReview').text(res.TITLE);
      })
        .fail(function(){
            alert("error");
        });

});