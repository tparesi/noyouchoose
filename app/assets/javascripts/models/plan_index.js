NYC.Models.PlanIndex = Backbone.Model.extend({
  url: 'api/plans',

  parse: function(response) {
    if (response.todays_plans) {
      this.todaysPlans().set(response.todays_plans);
      delete response.todays_plans;
    }

    if (response.upcoming_plans) {
      this.upcomingPlans().set(response.upcoming_plans);
      delete response.upcoming_plans;
    }

    if (response.past_plans) {
      this.pastPlans().set(response.past_plans);
      delete response.past_plans;
    }

    return response;
  },

  todaysPlans: function () {
    if (!this._todaysPlans) {
      this._todaysPlans = new NYC.Collections.Plans();
    }

    return this._todaysPlans;
  },

  upcomingPlans: function () {
    if (!this._upcomingPlans) {
      this._upcomingPlans = new NYC.Collections.Plans();
    }

    return this._upcomingPlans;
  },

  pastPlans: function () {
    if (!this._pastPlans) {
      this._pastPlans = new NYC.Collections.Plans();
    }

    return this._pastPlans;
  },

});
