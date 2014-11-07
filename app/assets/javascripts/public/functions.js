var get_book = function(){
    dateFrom = moment({y: $("#book_time_year").val(), M: $("#book_time_month").val(), d: $("#book_time_day").val(), h: $("#book_time_hour").val(), m: $("#book_time_minute").val()});
    dateTo = moment(dateFrom).add($("#book_range").val(), 'm');
    $("#booker_from").val(dateFrom);
    $("#booker_to").val(dateTo);
    $("#booker_trainer").val($("#trainer_is_trainer").val());
    $("#booker_exercise").val($("#book_exercise").val());
    $("#booker_location").val($("#book_location").val());
}

var get_registered_book = function(trainer_id){
    dateFrom = moment({ y: $("#rbook_time_year").val(), M: $("#rbook_time_month").val(), d: $("#rbook_time_day").val(), h: $("#rbook_time_hour").val(), m: $("#rbook_time_minute").val() }).format("YYYY-M-DD HH:mm");
    dateTo = moment(dateFrom).add($("#rbook_range").val(), 'm').format("YYYY-M-DD HH:mm");
    $("#rbook_from").val(dateFrom);
    $("#rbook_to").val(dateTo);
    $("#rbook_trainer").val(trainer_id);
}

var clear_book_form = function(){
    $("#first_time_use_form").change(function(){
        $(".trainer-list").html("");
        $("#booking_form").find('input[type="hidden"]').val("");
        $(".booking-fieldset").hide();
    });
}

var registered_user_booking = function(){
    dateFrom = moment({ y: $("#rbook_time_year").val(), M: $("#rbook_time_month").val(), d: $("#rbook_time_day").val(), h: $("#rbook_time_hour").val(), m: $("#rbook_time_minute").val() }).format("YYYY-M-DD HH:mm");
    dateTo = moment(dateFrom).add($("#rbook_range").val(), 'm').format("YYYY-M-DD HH:mm");
    $("#find_trainer").click(function(){
        alert(dateFrom);
        $.ajax({ url: "/users/registered_books/find_trainer?exercise="+$("#rbook_exercise").val()+"&from="+dateFrom+"&to="+dateTo+"&trainer="+$("#rtrainer_is_trainer").val()+"&user_email="+$("#rbook_email").val() });
    });
}