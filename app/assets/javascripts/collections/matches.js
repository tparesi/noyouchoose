NYC.Collections.Matches = Backbone.Collection.extend({
  initialize: function(options) {
    this.plan = options.plan;
  },

  url: function() {
    return '/api/plans/' + this.plan.id + '/matches'
  },

  model: NYC.Models.Restaurant
});
