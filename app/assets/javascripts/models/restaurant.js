NYC.Models.Restaurant = Backbone.Model.extend({

  urlRoot: 'api/restaurants',

  categories: function() {
    return this.get("categories") || [];
  },

  address: function() {
    return this.get("address") || [];
  }

});
