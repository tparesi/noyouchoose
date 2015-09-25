NYC.Views.PlansIndex = Backbone.View.extend({

  template: JST["plans/index"],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template.render({ plans: this.collection }));
    return this;
  }

});
