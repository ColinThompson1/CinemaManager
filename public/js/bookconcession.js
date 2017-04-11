/**
 * Created by Mark.Lin on 4/10/2017.
 */

$('#book-con').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var conSKU = button.data('title') // Extract info from data-* attributes

    $.post('concessionItem', {concessionSKU: conSKU})
        .done(function(res){

            $('#conName').text(res.ITEM);
            $('#conThumbnail').attr("src", res.IMG_PATH)

            $.post('concessionItem', {concessionSKU: res.SKU})
                .done(function(rev){
                    $('#conPrice').text("$"+res.PRICE);
                    $('#conDetails').empty();
                })
                .fail(function(){
                    alert("Could not grab concession info")
                });

        })
        .fail(function(){
            alert("error");
        });
});