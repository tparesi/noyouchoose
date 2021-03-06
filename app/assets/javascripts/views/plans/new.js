NYC.Views.NewPlan = Backbone.CompositeView.extend({

  template: JST["plans/new"],

  events: {
    "click #make-plan": "makePlan"
  },

  makePlan: function(event) {
    event.preventDefault();
    NYC.startLoader();
    var $detailPlan = this.$(".detail-plan-form");
    var $inviteFriends = this.$(".invite-friends-form");
    var $filterRestaurants = this.$(".filter-restaurant-form");
    var attrs = $detailPlan.serializeJSON();
    attrs = _.extend(attrs, $filterRestaurants.serializeJSON(), $inviteFriends.serializeJSON());
    var plan = new NYC.Models.Plan();
    plan.save(attrs, {
      success: function() {
        NYC.stopLoader();
        Backbone.history.navigate("#/plans/" + plan.id, {trigger: true});
      },
      error: function(model, response, options) {
        NYC.stopLoader();
        alert(response.responseJSON.join(", "));
      }
    });
  },

  render: function () {
    this.$el.html(this.template());
    this.addSubview(".detail-plan", new NYC.Views.DetailPlan());
    this.addSubview(".invite-friends", new NYC.Views.InviteFriends());
    this.addSubview(".filter-restaurants", new NYC.Views.FilterRestaurants());
    return this;
  }

});
