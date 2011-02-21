var GmailData = Backbone.Model.extend({
  url: '/gmail'
});

var gmail = new GmailData();
_.extend(gmail, Backbone.Events);

gmail.bind('change:unread', function(model) {
  $('#unreadCount').html(model.get('unread'));
});

gmail.bind('change:total', function(model) {
  $('#totalCount').html(model.get('total'));
});

gmail.bind('poll:start', function(model) {
  $('#totalCount').html(model.get('total'));
});