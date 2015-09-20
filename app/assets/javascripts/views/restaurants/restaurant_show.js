NYC.Views.RestaurantShow = Backbone.View.extend({

  template: JST["restaurants/show"],

  tagName: "li",

  className: "restaurant-show group",

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.plan = options.plan;
    this.planShow = options.planShow;
  },

  events: {
    "click .swipe-left": "swipeLeft",
    "click .swipe-right": "swipeRight"
  },

  swipeLeft: function() {
    $.ajax({
      url: '/api/swipes',
      method: 'POST',
      data: {
        swipe: {
          swipe_type: 'left',
          restaurant_id: this.model.id,
          plan_id: this.plan.id
        }
      },
      dataType: 'json',
      success: function() {
        this.plan.get("restaurants").shift();
        this.planShow.trigger("swipe");
        this.remove();
      }.bind(this)
    });
  },

  swipeRight: function() {
    $.ajax({
      url: '/api/swipes',
      method: 'POST',
      data: {
        swipe: {
          swipe_type: 'right',
          restaurant_id: this.model.id,
          plan_id: this.plan.id
        }
      },
      dataType: 'json',
      success: function() {
        this.plan.get("restaurants").shift();
        this.planShow.trigger("swipe");
        this.remove();
      }.bind(this)
    });
  },

  render: function() {
    this.$el.html(this.template({restaurant: this.model}));
    return this;
  }
});
