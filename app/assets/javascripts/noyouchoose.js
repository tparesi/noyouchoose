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
      var $modal = $('.modal').addClass("is-open");
      var $modalScreen = $(".modal-screen").addClass("is-open");
      $modal.find(".modal-message").text("Yay! You have a match. You both want to eat at " + data.restaurant);
      window.setTimeout(function() {
        $modal.removeClass("is-open");
        $modalScreen.removeClass("is-open");
      }, 5000)
    });
  }

};
