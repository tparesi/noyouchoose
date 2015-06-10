NYC.Views.DetailPlan = Backbone.View.extend({
  template: JST["plans/detail_plan"],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
});
