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

function alertError(error) {
  console.log("error", error);
}

$(function() {  
  Backbone.sync('read', gmail, handleGmailResponse, alertError);
  // Backbone.sync('read', tracker, handleTrackerResponse, alertError);
  // stories.fetch();
  
});