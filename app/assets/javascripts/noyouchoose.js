window.NYC = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.router = new NYC.Routers.Router({ $rootEl: $("#main")});
    Backbone.history.start();
  },

  startLoader: function () {
    $(document).ajaxStart(function() {
      $("body").addClass("loading");
      var counter = 0;
      spinModal = setInterval(function() {
          var frames=30; var frameWidth = 128;
          var offset=counter * -frameWidth;
          document.getElementById("spinner").style.backgroundPosition=
              offset + "px" + " " + 0 + "px";
          counter++; if (counter>=frames) counter = 0;
      }, 100);
    });
  },

  stopLoader: function () {
    $(document).ajaxStop(function() {
      $("body").removeClass("loading");
      clearInterval(spinModal);
    });
  },
};
