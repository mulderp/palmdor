var MoviesView = Backbone.View.extend({

  events: {},

  initialize: function() {
    console.log("show");
  }

});

var Controller = function() {

  this.showMovie = function(id) {
    console.log('showMovie');
    var movie = new MoviesView();
  }

}

module.exports = Controller;
