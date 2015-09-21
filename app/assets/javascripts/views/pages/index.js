NYC.Views.IndexPage = Backbone.View.extend({
  //Model: PlanIndex

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  template: JST["pages/index"],

  events: {
    "click a.pseudo-link.toggle-closed": "toggleClose"
  },

  className: 'index-page group',

  toggleClose: function (e) {
    e.preventDefault;
    var $clickedSection = $(e.target).parent(),
        $planList = $clickedSection.find("ul");

    $planList.hasClass("closed") ? $planList.removeClass("closed") : $planList.addClass("closed");
  },

  templateVariables: function () {
    return {
      pastPlans: this.model.pastPlans().models,
      upcomingPlans: this.model.upcomingPlans().models,
      todaysPlans: this.model.todaysPlans().models
    };
  },

  render: function () {
    var content = this.template(this.templateVariables());
    this.$el.html(content);
    return this;
  }
});
