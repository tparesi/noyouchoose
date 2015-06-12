window.NYC = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.router = new NYC.Routers.Router({ $rootEl: $("#main")});
    Backbone.history.start();

    var channel = window.pusher.subscribe('matches');

    channel.bind('new_match', function(data) {
      alert('MATCH!!!');
    });
  }
  
};
