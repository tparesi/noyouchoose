NYC.Views.NewPlan = Backbone.CompositeView.extend({

  template: JST["plans/new"],

  render: function(){
    this.$el.html(this.template());
    this.addSubview(".choose_restaurants", new NYC.Views.FilterRestaurants());
    return this;
  }

});
