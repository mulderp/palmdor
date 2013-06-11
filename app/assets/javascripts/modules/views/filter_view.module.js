var FilterView = Backbone.View.extend({

  events: {
    'click a': 'handleSelect',
    'click input': 'handleFilter'
  },

  handleSelect: function(ev) {
    ev.preventDefault();
    var action = $(ev.currentTarget).data('action');
    var that = this;
    if (action == 'next') {
      that.controller.showNext();
    }
    else {
      that.controller.showPrevious();
    }
  },

  handleFilter: function(ev) {
    var filter = $(ev.currentTarget).data('filter');
  },


  initialize: function(opts) {
    this.controller = opts.controller;
  }

});

module.exports = FilterView;
