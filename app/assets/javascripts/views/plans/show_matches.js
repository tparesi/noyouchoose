NYC.Views.ShowMatches = Backbone.CompositeView.extend({
  template: JST["plans/matches"],

  initialize: function() {
    this.model.fetch();

    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.model.matches().each(function (restaurant) {
      this.addRestaurantView(restaurant);
    }.bind(this));
    return this;
  },

  addRestaurantView: function (restaurant) {
    var subview = new NYC.Views.RestaurantMatch({ model: restaurant });
    this.addSubview('.restaurants', subview);
  },

});
