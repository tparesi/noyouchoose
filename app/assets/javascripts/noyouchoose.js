window.NYC = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new NYC.Routers.Router({
      $rootEl: $("#main"),
    });
  }
};
