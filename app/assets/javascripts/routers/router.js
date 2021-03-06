NYC.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    NYC.CurrentUser = new NYC.Models.CurrentUser();
  },

  routes: {
    "": "homepage",
    "_=_": "sanitize",
    "plans/new": "newPlan",
    "plans/:id": "showPlan",
    "plans/:id/matches": "showMatches",
  },

  homepage: function() {
    NYC.CurrentUser.fetch({
      success: function () {
        if (NYC.CurrentUser.isLoggedIn()) {
          this.planIndex();
        } else {
          this.loginPage();
        }
      }.bind(this)
    });
  },

  planIndex: function () {
    var currentUserPlans = new NYC.Models.PlanIndex();
    currentUserPlans.fetch();
    var indexPage = new NYC.Views.IndexPage({ model: currentUserPlans });
    this._swapView(indexPage);
  },

  loginPage: function () {
    var loginPage = new NYC.Views.LoginPage();
    this._swapView(loginPage);
  },

  newPlan: function() {
    var newPlan = new NYC.Views.NewPlan();
    this._swapView(newPlan);
  },

  showPlan: function(id) {
    var plan = new NYC.Models.Plan({id: id});
    var showPlan = new NYC.Views.ShowPlan({ model: plan });
    this._swapView(showPlan);
  },

  showMatches: function(id) {
    var plan = new NYC.Models.Plan({id: id});
    var matches = new NYC.Collections.Matches({plan: plan});
    matches.fetch();
    var showMatches = new NYC.Views.ShowMatches({ model: plan, collection: matches });
    this._swapView(showMatches);
  },

  sanitize: function() {
    Backbone.history.navigate("#", {trigger: true});
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  },
});
