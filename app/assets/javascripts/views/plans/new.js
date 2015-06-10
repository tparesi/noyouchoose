NYC.Views.NewPlan = Backbone.View.extend({

  template: JST["plans/new"],

  events: {
    "click .filter": "filterRestaurants"
  },

  filterRestaurants: function(event) {
    event.preventDefault();
    filtered = new NYC.Collections.Restaurants();
    filtered.fetch({
      data: $(event.currentTarget).parent().serializeJSON(),
      success: function(response) {
        debugger
      }
    });
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }

});
