var LoginView = Backbone.View.extend({

  events: {
    'click button': 'handleClick'
  },

  renderJoin: function() {
    $("#splash").html(HandlebarsTemplates["login"]());
  },

  renderLogin: function() {
    console.log(HandlebarsTemplates);
  },
  handleClick: function(ev) {
    var action = $(ev.currentTarget).data("action");
    if (action == "join") {
      this.renderJoin();
    } else {
      this.renderLogin();
    };
  },

  initialize: function() {

  }
});
module.exports = LoginView;
