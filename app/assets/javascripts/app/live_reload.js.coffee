renewNotif = (count) ->
 $('#notifications-counter').text(count)

gon.watch('count_unread', interval: 3000, renewNotif)