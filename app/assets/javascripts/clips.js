window.onload = function () {


    $('.clip-text').click(function () {
        console.log($(this).val().length);
        key_count_global = $(this).val().length;
        console.log('saved value');
    });
    $('#clips').on('keyup', '.clip-text', function () {

        var key_count = $(this).val().length;
        key_count_global = key_count;

        setTimeout("save_if_changed(" + key_count + ")", 1000);
    });

} // end on document load


function save_if_changed(current_count) {
    if (current_count == key_count_global) { // The control will reach this point 1 second after user stops typing.
        console.log('saving..');
        $('.edit_ip').submit();
    }

}

$(document).on('nested:fieldAdded', function (event) {
//    // this field was just inserted into your form
//    var field = event.field;
//    // it's a jQuery object already! Now you can find date input
//    var dateField = field.find('.date');
//    // and activate datepicker on it

    $('.edit_ip').submit();
    location.reload();
//    console.log(field);
})

$(document).on('nested:fieldRemoved', function (event) {
//    // this field was just inserted into your form
//    var field = event.field;
//    // it's a jQuery object already! Now you can find date input
//    var dateField = field.find('.date');
//    // and activate datepicker on it
    $('.edit_ip').submit();
    location.reload();
//    console.log(field);
})