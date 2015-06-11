NYC.Views.InviteFriends = Backbone.View.extend({

  initialize: function() {
    this.collection = new NYC.Collections.Users();
    this.collection.fetch();
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST["plans/invite_friends"],

  // events: {
  //   "click .friend": "toggleChecked"
  // },
  //
  // toggleChecked: function (event) {
  //
  // },

  render: function () {
    var content = this.template({ users: this.collection });
    this.$el.html(content);
    return this;
  }
});
