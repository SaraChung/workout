var get_book = function(){
    dateFrom = moment($("#book_time_year").val()+"-"+$("#book_time_month").val()+"-"+$("#book_time_day").val()+"T"+$("#book_time_hour").val()+":"+$("#book_time_minute").val()).format("YYYY-M-DD h:mm");
    dateTo = moment(dateFrom).add($("#book_range").val(), 'm').format("YYYY-M-DD h:mm");
    $("#booker_from").val(dateFrom);
    $("#booker_to").val(dateTo);
    $("#booker_trainer").val($("#trainer_is_trainer").val());
    $("#booker_exercise").val($("#book_exercise").val());
    $("#booker_location").val($("#book_location").val());
    $("#booker_is_private").val($("#book_is_private").val());
}

var get_registered_book = function(trainer_id){
    dateFrom = moment($("#rbook_time_year").val()+"-"+$("#rbook_time_month").val()+"-"+$("#rbook_time_day").val()+"T"+$("#rbook_time_hour").val()+":"+$("#rbook_time_minute").val()).format("YYYY-M-DD h:mm");
    dateTo = moment(dateFrom).add($("#rbook_range").val(), 'm').format("YYYY-M-DD h:mm");
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

    $("#registered_user_form").change(function(){
        $(".trainer-list").html("");
        $(".booking-fieldset").hide();
        $("#booking_form").find('input[type="hidden"]').val("");
    });

    $("#registered_link, #first_time_link").click(function(){
        $(".trainer-list").html("");
        $(".booking-fieldset").hide();
        $("#booking_form").find('input[type="hidden"]').val("");
        $(this).find('input[type="text"]').val(""); 
    });

}

var registered_user_booking = function(){
    $("#find_trainer").click(function(){
        dateFrom = moment($("#rbook_time_year").val()+"-"+$("#rbook_time_month").val()+"-"+$("#rbook_time_day").val()+"T"+$("#rbook_time_hour").val()+":"+$("#rbook_time_minute").val()).format("YYYY-M-DD h:mm");
        dateTo = moment(dateFrom).add($("#rbook_range").val(), 'm').format("YYYY-M-DD h:mm");
        $.ajax({ url: "/users/registered_books/find_trainer?exercise="+$("#rbook_exercise").val()+"&from="+dateFrom+"&to="+dateTo+"&trainer="+$("#rtrainer_is_trainer").val()+"&user_email="+$("#rbook_email").val() });
    });
}

var view_notification = function(){
    $(".feed").click(function(){
        $.get("/trainers/notifications/show", { notif_id: $(this).data("feed") });
        $(".modal-state").prop('checked', true);
        $(this).removeClass("unread").addClass("read");
    });
}

var renewNotifCount = function(count) {
  return $('#notifications-counter').text(count);
};