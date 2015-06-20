NYC.Views.ShowPlan = Backbone.CompositeView.extend({

  template: JST["plans/show"],

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.bind('swipe', this.render);

    var channel = window.pusher.subscribe('matches_for_plan_' + this.id);

    channel.bind('new_match', function(data) {
      var $modal = $('.modal').addClass("is-open");
      var $modalScreen = $(".modal-screen").addClass("is-open");
      $modal.find(".modal-message").text("Yay! You have a match. You both want to eat at " + data.restaurant);
      window.setTimeout(function() {
        $modal.removeClass("is-open");
        $modalScreen.removeClass("is-open");
      }, 5000);
    });
  },

  className: "plan-show",

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
