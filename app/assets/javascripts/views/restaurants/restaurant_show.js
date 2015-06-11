NYC.Views.RestaurantShow = Backbone.View.extend({

  template: JST["restaurants/show"],

  tagName: "li",

  className: "restaurant-show group",

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .swipe-left": "swipeLeft",
    "click .swipe-right": "swipeRight"
  },

  swipeLeft: function() {
    // actually do something
    this.remove();
  },

  swipeRight: function() {
    // actually do something
    this.remove();
  },

  render: function() {
    this.$el.html(this.template({restaurant: this.model}));
    return this;
  }
});
