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

  showPlan: function(id) {
    var plan = new NYC.Models.Plan({id: id});
    plan.fetch();
    var showPlan = new NYC.Views.ShowPlan({ model: plan });
    this._swapView(showPlan);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  },
});
