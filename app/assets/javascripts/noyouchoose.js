window.NYC = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.router = new NYC.Routers.Router({ $rootEl: $("#main")});
    Backbone.history.start();

  }

};
