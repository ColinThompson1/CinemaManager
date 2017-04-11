/**
 * Created by Mark.Lin on 4/10/2017.
 */

$('#book-con').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var conSKU = button.data('title') // Extract info from data-* attributes

    $.post('concessionItem', {concessionSKU: conSKU})
        .done(function(res){
            $('#conName').text(res.ITEM);

            $.post('concessionItem', {concessionSKU: res.SKU})
                .done(function(rev){
                    $('#conPrice').text("$"+rev.PRICE);
                    $('#conThumbnail').attr("src", rev.IMG_PATH);
                    $('#conDetails').empty();
                    $('#buyConcession').data('id', conSKU);
                })
                .fail(function(){
                    alert("Could not grab concession info")
                });

        })
        .fail(function(){
            alert("error");
        });
});

$('#buyConcession').click(function (){
    conSKU = $(this).data('id')

    $.post('getConcession', {concessionSKU: conSKU})
        .done(function(res){
            alert("Concession bought!");
        })
        .fail(function(){
            alert("Are you sure...? You should really go on a diet...")
        })
});