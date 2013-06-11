var FilterView = require('./views/filter_view');

var MoviesView = Backbone.View.extend({
  events: {},

  initialize: function() {
    console.log("show");
  }
});

var DetailsView = Backbone.View.extend({

  el: $('#details'),

  template: 'details',

  render: function() {
    var tmpl = HandlebarsTemplates[this.template]({title: this.title});
    this.$el.html(tmpl);
  },

  initialize: function(opts) {
    this.title = opts.movie;
    this.controller = opts.controller;
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

  this.showMovie = function(movie) {
    var movie = new DetailsView({movie: movie, controller: this});
  };

  this.showPrevious = function() {
    this.selected -= 1;
    this.showMovie(this.movie_ids[this.selected]);
  };

  this.showNext = function(id) {
    this.selected += 1;
    console.log(this.selected);
    this.showMovie(this.movie_ids[this.selected]);
  };

  this.start = function() {
    _.bindAll(this, 'showNext', 'showPrevious');

    var movies = $("#movies").find('article');

    var idx = 0;
    this.movie_ids = _.map(movies, function(movie) {
      idx += 1;
      return $(movie).data('movie');
    });

    var that = this;
    $('#movies').masonry();

    _.each(movies, function(movie) {
      var movieItem = new MovieView({el: movie});
      movieItem.on('show:movie', function(movie) {
        that.showMovie(movie);
      });
    });

    this.selected = 0;
    this.showMovie(this.movie_ids[0]);
    var filterView = new FilterView({el: $("#filter"), controller: this});
  };
}


module.exports = Controller;
