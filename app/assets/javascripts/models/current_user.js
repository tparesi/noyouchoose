NYC.Models.CurrentUser = Backbone.Model.extend({
  url: "api/sessions",

  isLoggedIn: function () {
    return !!this.get("name");
  }
})
