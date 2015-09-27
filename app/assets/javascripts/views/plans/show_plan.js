NYC.Views.ShowPlan = Backbone.CompositeView.extend({
  // Model: Plan

  template: JST["plans/show"],

  initialize: function() {
    this.model.fetch();

    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model, "sync", this.subscribeToChannel);
    this.bind('swipe', this.render);
  },

  className: "plan-show",

  subscribeToChannel: function() {
    var channel = window.pusher.subscribe('matches_for_plan_' + this.model.id);
    channel.bind('new_match', function(data) {
      var match = new NYC.Models.Match(data)
      var matchModal = new NYC.Views.MatchModal({
        el: $('.modal'),
        $el: $(".modal"),
        model: match
      });
      matchModal.render();

      //TODO: ask Lily why this fetch was here
      // this.model.fetch();
    }.bind(this));
  },

  render: function() {
    this.$el.html(this.template({plan: this.model}));
    if (this.model.get("restaurants")) {
      if (this.model.get("restaurants")[0]) {
        restaurant = new NYC.Models.Restaurant({id: this.model.get("restaurants")[0].id});
        restaurant.fetch({
          success: function() {
            var restaurantShow = new NYC.Views.RestaurantShow({
              model: restaurant,
              plan: this.model,
              planShow: this
            });
            this.addSubview(".pending-restaurants", restaurantShow);
          }.bind(this)
        });
      } else {
        this.$(".pending-restaurants").html("Oh no! <br> You've run out of restaurants to swipe on! <br> :(");
        this.$(".pending-restaurants").css("height", "225px");
        this.$(".pending-restaurants").css("padding-top", "125px");
        this.$(".pending-restaurants").css("text-align", "center");
      }
    }
    return this;
  }

});
