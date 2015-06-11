NYC.Views.ShowPlan = Backbone.CompositeView.extend({

  template: JST["plans/show"],

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  className: "plan-show",

  render: function() {
    this.$el.html(this.template({plan: this.model}));
    this.model.restaurants().forEach(function(restaurant){
      var restaurantShow = new NYC.Views.RestaurantShow({model: restaurant});
      this.addSubview(".pending-restaurants", restaurantShow);
    }.bind(this));
    return this;
  }

});
