var MoviesView = Backbone.View.extend({

  events: {},

  initialize: function() {
    console.log("show");
  }

});

var DetailsView = Backbone.View.extend({
  el: $('#details'),
  template: 'templates/details',
  render: function() {
    this.$el.html(this.movie);
  },
  initialize: function(opts) {
    this.movie = opts.movie;
    this.render();
  }
});

var MovieView = Backbone.View.extend({

  events: {
    "click": "handleClick"
  },

  handleClick: function(ev) {
    var movie = $(ev.currentTarget).data('movie');
    this.trigger("show:movie", movie);
  },

  initialize: function(opts) {
    console.log("show");
  }

});

var Controller = function() {

  this.showMovie = function(id) {
    var movie = new DetailsView({movie: id});
  };

  this.start = function() {
    var movies = $("#movies");
    var that = this;
    movies.masonry();

    _.each(movies.find('article'), function(movie) {
      var movieItem = new MovieView({el: movie});
      movieItem.on('show:movie', function(movie) {
        that.showMovie(movie);
      });
    });

  };
}


module.exports = Controller;
