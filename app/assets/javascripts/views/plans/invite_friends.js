NYC.Views.InviteFriends = Backbone.View.extend({

  initialize: function() {
    this.collection = new NYC.Collections.Users();
    this.collection.fetch();
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST["plans/invite_friends"],

  events: {
    "click .invite-friend": "inviteFriend"
  },

  inviteFriend: function(event) {
    // TODO: make an invite
    alert("this is a todo!")
  },

  render: function () {
    debugger
    var content = this.template({ users: this.collection });
    this.$el.html(content);
    return this;
  }
});
