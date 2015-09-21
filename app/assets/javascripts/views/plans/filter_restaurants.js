NYC.Views.FilterRestaurants = Backbone.View.extend({

  template: JST["plans/filter_restaurants"],

  events: {
    "click .filter": "filterRestaurants"
  },

  filterRestaurants: function(event) {
    event.preventDefault();
    filtered = new NYC.Collections.Restaurants();
    filtered.fetch({
      data: $(event.currentTarget).parent().serializeJSON(),
      success: function(response) {
        //TODO
        console.log("figure this out");
      }
    });
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  }

});
