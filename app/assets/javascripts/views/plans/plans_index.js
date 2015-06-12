NYC.Views.PlansIndex = Backbone.View.extend({

  template: JST["plans/index"],

  render: function() {
    this.$el.html(this.template.render({ plans: this.collection }));
    return this;
  }

});
