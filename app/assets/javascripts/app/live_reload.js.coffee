renewNotif = (count) ->
 $('#notifications-counter').text(count)

gon.watch('count_unread', interval: 2000, renewNotif)