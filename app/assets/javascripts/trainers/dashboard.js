$(document).ready(function() {
  gon.watch('notif', { interval: 3000, url: '/trainers/dashboard/latest_feeds'});
  view_notification();
});
