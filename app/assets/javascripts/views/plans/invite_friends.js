NYC.Views.InviteFriends = Backbone.View.extend({
  template: JST["plans/invite_friends"],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
});
