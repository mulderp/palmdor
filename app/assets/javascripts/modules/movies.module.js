var LoginView = require("./login");

var moviesView = Backbone.View.extend({

  events: {},

  initialize: function() {
    var loginView = new LoginView({el: $("#splash")});
  }

});

module.exports = moviesView;
