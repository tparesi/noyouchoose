NYC.Views.ShowMatches = Backbone.CompositeView.extend({
  template: JST["plans/matches"],

  initialize: function() {
    this.listenTo(this.collection, "add", this.addRestaurantView);
  },

  render: function () {
    this.$el.html(this.template());
    return this;
  },

  addRestaurantView: function (restaurant) {
    var subview = new NYC.Views.RestaurantMatch({ model: restaurant });
    this.addSubview('.restaurants', subview);
  },

});
