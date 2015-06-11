NYC.Views.RestaurantShow = Backbone.View.extend({

  template: JST["restaurants/show"],

  tagName: "li",

  className: "restaurant-show group",

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.plan = options.plan
  },

  events: {
    "click .swipe-left": "swipeLeft",
    "click .swipe-right": "swipeRight"
  },

  swipeLeft: function() {
    this.remove();
  },

  swipeRight: function() {
    $.ajax({
      url: '/api/swipe_rights',
      method: 'POST',
      data: {
        swipe_right: {
          restaurant_id: this.model.id,
          plan_id: this.plan.id
        }
      },
      dataType: 'json',
      success: function() {
        this.remove();
      }.bind(this)
    });
  },

  render: function() {
    this.$el.html(this.template({restaurant: this.model}));
    return this;
  }
});
