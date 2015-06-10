NYC.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "homepage",
    "plans/new": "newPlan",
    "plans/:id": "showPlan",
  },

  homepage: function() {

  },

  newPlan: function() {
    var newPlan = new NYC.Views.NewPlan();
    this._swapView(newPlan);
  },

  showPlan: function() {

  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  },
});
