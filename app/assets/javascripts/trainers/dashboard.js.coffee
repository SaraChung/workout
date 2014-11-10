renewNotifCount = (count) ->
 $('#notifications-counter').text(count)

gon.watch('count_unread', interval: 3000, renewNotifCount)
gon.watch('notif', { interval: 3000, url: '/trainers/dashboard/latest_feeds'})
view_notification()
