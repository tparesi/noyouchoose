NYC.Models.Plan = Backbone.Model.extend({

  urlRoot: 'api/plans',

  parse: function(response) {
    if (response.restaurants) {
      this.restaurants().set(response.restaurants, { parse: true });
      delete response.restaurants;
    }

    return response;
  },

  restaurants: function() {
    if (!this._restaurants) {
      this._restaurants = new NYC.Collections.Restaurants();
    }

    return this._restaurants;
  },

  toJSON: function(){
    var json = { plan: _.clone(this.attributes) };
    return json;
  }

});
