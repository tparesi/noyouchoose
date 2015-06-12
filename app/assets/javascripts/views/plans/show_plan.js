NYC.Views.ShowPlan = Backbone.CompositeView.extend({

  template: JST["plans/show"],

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.bind('swipe', this.render);
  },

  className: "plan-show",

  render: function() {
    this.$el.html(this.template({plan: this.model}));
    if (this.model.get("restaurants")) {
      restaurant = new NYC.Models.Restaurant({id: this.model.get("restaurants")[0].id});
      restaurant.fetch({
        success: function() {
          var restaurantShow = new NYC.Views.RestaurantShow({
            model: restaurant,
            plan: this.model,
            planShow: this
          });
          this.addSubview(".pending-restaurants", restaurantShow);
        }.bind(this)
      });
    }
    return this;
  }

});
