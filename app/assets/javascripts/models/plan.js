NYC.Models.Plan = Backbone.Model.extend({

  urlRoot: 'api/plans',

  parse: function(response) {
    if (response.users) {
      this.users().set(response.users);
      delete response.users;
    }

    return response;
  },

  toJSON: function(){
    var json = { plan: _.clone(this.attributes) };
    return json;
  },

  users: function() {
    if (!this._users) {
      this._users = new NYC.Collections.Users([]);
    }

    return this._users;
  }

});
