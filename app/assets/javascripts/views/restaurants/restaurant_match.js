NYC.Views.RestaurantMatch = Backbone.View.extend({

  template: JST["restaurants/match"],

  tagName: "li",

  className: "restaurant-match",

  initialize: function() {
    this.model.fetch();
    
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({restaurant: this.model}));
    return this;
  }
});
