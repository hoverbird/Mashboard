var GmailData = Backbone.Model.extend({});
var gmail = new GmailData();
_.extend(gmail, Backbone.Events);

gmail.bind('change:unread', function(model) {
  $('#unreadCount').html(model.get('unread'));
});

gmail.bind('change:total', function(model) {
  $('#totalCount').html(model.get('total'));
});


function pollGmail() {
  gmail.trigger("poll:start", "polling!");
  $.ajax({
    type: 'get',
    url: '/gmail',
    dataType: 'jsonp',
    success: handleGmailResponse
  });
}

function handleGmailResponse(data) {
  gmail.trigger("poll:stop", "done!");
  gmail.set(data);
}

pollGmail();
