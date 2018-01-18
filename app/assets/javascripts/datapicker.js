$( document ).on('turbolinks:load', function() {
    $('.datepicker').datepicker({
        todayHighlight: true,
        format: "dd-mm-yyyy",
        autoclose: true
    });
})