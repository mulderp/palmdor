var FilterView = require('./views/filter_view');

var DetailsView = Backbone.View.extend({

  el: $('#details'),

  template: 'details',

  render: function() {
    var tmpl = HandlebarsTemplates[this.template](this.model);
    this.$el.html(tmpl);
  },

  initialize: function(opts) {
    this.controller = opts.controller;
    this.render();
  }
});

var MovieView = Backbone.View.extend({

  events: {
    "click": "handleClick"
  },

  handleClick: function(ev) {
    ev.preventDefault();
    console.log("show");
    var movie = $(ev.currentTarget).data('movie');
    this.trigger("show:movie", movie);
  },

  initialize: function(opts) {
    console.log("show");
  }

});

var Controller = function() {

  this.showMovie = function(movie) {
    new DetailsView({model: movie, controller: this});
  };

  this.showPrevious = function() {
    if (this.selected > 0) {
      this.selected -= 1;
    }
    else
    {
      this.selected = _.size(this.movies) - 1;
    }
    this.showMovie(this.movies[this.selected]);
  };

  this.showNext = function(id) {
    if (this.selected < (_.size(this.movies) - 1)) {
      this.selected += 1;
    }
    else
    {
      this.selected = 0;
    }

    console.log(this.selected);
    this.showMovie(this.movies[this.selected]);
  };

  this.start = function() {
    _.bindAll(this, 'showNext', 'showPrevious');

    var $movies = $("#movies").find('article');

    this.movies = _.map($movies, function(movie) {
      var title = $(movie).find(".title").text();
      var description = $(movie).find(".description").text();
      return { title: title, slug: $(movie).data('movie'), description: description };
    });

    var that = this;
    _.each($movies, function(movie) {
      var movieItem = new MovieView({el: movie});
      movieItem.on('show:movie', function(slug) {
        var movie = _.where(that.movies, {slug: slug})[0];
        that.selected = _.indexOf(that.movies, movie);
        that.showMovie(movie);
      });
    });

    this.selected = 0;
    this.showMovie(this.movies[0]);
    var filterView = new FilterView({el: $("#filter"), controller: this});
  };
}


module.exports = Controller;
