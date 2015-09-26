NYC.Views.ShowMatches = Backbone.CompositeView.extend({
  template: JST["plans/matches"],

  initialize: function() {
    this.collection.fetch();
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.collection.each(function (restaurant) {
      this.addRestaurantView(restaurant);
    }.bind(this));
    return this;
  },

  addRestaurantView: function (restaurant) {
    var subview = new NYC.Views.RestaurantMatch({ model: restaurant });
    this.addSubview('.restaurants', subview);
  },

});
