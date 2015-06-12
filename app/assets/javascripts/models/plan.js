NYC.Models.Plan = Backbone.Model.extend({

  urlRoot: 'api/plans',

  toJSON: function(){
    var json = { plan: _.clone(this.attributes) };
    return json;
  }

});
