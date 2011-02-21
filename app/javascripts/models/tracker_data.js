var TrackerStory = Backbone.Model.extend();
var TrackerStories = Backbone.Collection.extend({
  url : '/tracker/stories'
});

var stories = new TrackerStories();
_.extend(stories, Backbone.Events);

stories.bind('refresh', function(model) {
  var storyBuffer = '';
  stories.each(function(story, key) {
    storyBuffer += '<li>' + story.get('name') + '</li>';    
  });
  $('#tracker .iteration').html($(storyBuffer));
});

stories.fetch();
