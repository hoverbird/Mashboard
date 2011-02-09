var gmail;
var GmailData = Backbone.Model.extend({});

$.ajax({
  type: 'get',
  url: '/gmail',
  dataType: 'jsonp',
  success: function(data) {
    parseGmailResponse(data);
  }
});

function parseGmailResponse(data) {
  gmail = new GmailData(data);
  $('#unreadCount').html('unread: '+ gmail.get('unread') + " total: " + gmail.get('total'));
  console.log('success! ', gmail);
}