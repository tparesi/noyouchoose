NYC.Views.MatchModal = Backbone.View.extend({
  // Model: Match

  initialize: function () {
  },

  template: JST['plans/match_modal'],

  className: "modal",

  events: {
    "click .modal-internal": "close"
  },

  close: function() {
    this.$el.removeClass("is-open")
    $("modal-screen").removeClass("is-open")
  },

  render: function() {
    var content = this.template({ match: this.model });
    this.$el.html(content);
    this.$el.addClass("is-open");
    $("modal-screen").addClass("is-open");
    return this;
  }

});
