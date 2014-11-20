var get_book = function(){
    dateFrom = moment({ y: parseInt($("#book_time_year").val()), M: parseInt($("#book_time_month").val()) - 1, d: parseInt($("#book_time_day").val()), h: parseInt($("#book_time_hour").val()), m: $("#book_time_minute").val()}).format("YYYY-MM-DD hh:mm");
    dateTo = moment(dateFrom).add($("#book_range").val(), 'm').format("YYYY-MM-DD hh:mm");
    $("#booker_from").val(dateFrom);
    $("#booker_to").val(dateTo);
    $("#booker_trainer").val($("#trainer_is_trainer").val());
    $("#booker_exercise").val($("#book_exercise").val());
    $("#booker_location").val($("#book_location").val());
    $("#booker_is_private").val($("#book_is_private").val());
}

var get_registered_book = function(trainer_id){
    dateFrom = moment({ y: parseInt($("#rbook_time_year").val()), M: parseInt($("#rbook_time_month").val()) - 1, d: parseInt($("#rbook_time_day").val()), h: parseInt($("#rbook_time_hour").val()), m: $("#rbook_time_minute").val()}).format("YYYY-MM-DD hh:mm");
    dateTo = moment(dateFrom).add($("#rbook_range").val(), 'm').format("YYYY-MM-DD hh:mm");
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
        dateFrom = moment({ y: parseInt($("#rbook_time_year").val()), M: parseInt($("#rbook_time_month").val()) - 1, d: parseInt($("#rbook_time_day").val()), h: parseInt($("#rbook_time_hour").val()), m: $("#rbook_time_minute").val()}).format("YYYY-MM-DD hh:mm");
        dateTo = moment(dateFrom).add($("#rbook_range").val(), 'm').format("YYYY-MM-DD hh:mm");
        $.ajax({ url: "/users/registered_books/find_trainer?exercise="+$("#rbook_exercise").val()+"&from="+dateFrom+"&to="+dateTo+"&trainer="+$("#rtrainer_is_trainer").val()+"&user_email="+$("#rbook_email").val() });
    });
}

var view_notification = function(){
    $(".feed").click(function(){
        $(".modal-window").html("");
        $.get("/trainers/notifications/"+$(this).data("feed"));
        $(".modal-state").prop('checked', true);
        $(".feed-box[data-feed="+$(this).data("feed")+"]").removeClass("unread").addClass("read");
    });
}

var renewNotifCount = function(count) {
  return $('#notifications-counter').text(count);
}

var renewWorkoutStatus = function(){
  $("button.workout-status.active").prop('disabled', true);
  $("button.workout-status").click(function(){
    $.post("/trainers/workout_sessions/"+$("#workout_id").val()+"/update_status", { status: $(this).data("workstat") });
        $("button.workout-status").removeClass("active").prop('disabled', false);
        $(this).addClass("active").prop('disabled', true);
  });
}