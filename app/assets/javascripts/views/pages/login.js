NYC.Views.LoginPage = Backbone.View.extend({

  initialize: function() {
    this.render();
  },

  className: 'login-page group',

  template: JST['pages/login'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  }

});
