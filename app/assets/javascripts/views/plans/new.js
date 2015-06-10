NYC.Views.NewPlan = Backbone.View.extend({

  template: JST["plans/new"],

  render: function(){
    this.$el.html(this.template());
    return this;
  }

});
