$(document).ready(function() {
  gon.watch('count_unread', { interval: 3000 }, renewNotifCount);
  view_notification();
});