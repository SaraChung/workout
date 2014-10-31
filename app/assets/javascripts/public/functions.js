var get_book = function(){
    dateFrom = moment({y: $("#book_time_year").val(), M: $("#book_time_month").val(), d: $("#book_time_day").val(), h: $("#book_time_hour").val(), m: $("#book_time_minute").val()});
    dateTo = moment(dateFrom).add($("#book_range").val(), 'm');
    $("#booker_from").val(dateFrom);
    $("#booker_to").val(dateTo);
    $("#booker_trainer").val($("#trainer_is_trainer").val());
    $("#booker_exercise").val($("#book_exercise").val());
    $("#booker_location").val($("#book_location").val());
}

var clear_book_form = function(){
  $("#first_time_use_form").change(function(){
    $(".trainer-list").html("");
    $("#booking_form").find('input[type="hidden"]').val("");
    $(".booking-fieldset").hide();
  });
}