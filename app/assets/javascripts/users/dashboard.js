$(document).ready(function() {
  gon.watch('notif', { interval: 3000, url: '/users/dashboard/latest_feeds'});
  view_notification_users();
});
