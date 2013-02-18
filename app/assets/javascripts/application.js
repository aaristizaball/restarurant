// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


var ii_app = {};
(function () {
    this.dragged = false;
    this.init = function () {
        setupButtons();
        this.reset();	
       
    };

    this.reset = function () {
    };

    var setupButtons = function () {
            ii_transitions.init();
        };

}).apply(ii_app);


jQuery(function () {
    ii_app.init();

    $('body').delegate('.back', 'click', function (e) {
        e.preventDefault();
        window.history.back();
    });
});

(function ($) {
    $.fn.extend({
        hideElement: function (SELECTOR) {
            return $(SELECTOR, this).each(function () {
                this.style.webkitTransform = 'scale(0)';
            });
        },
        showElement: function (SELECTOR) {
            return $(SELECTOR, this).each(function () {
                //this.style.webkitTransition = '-webkit-transform ' + (Math.random() * 1) + 's ease-in';
                this.style.webkitTransition = '-webkit-transform ' + 1 + '100ms 0s ease-out';
                this.style.webkitTransform = 'scale(1)';
            });

        }
    });
})(jQuery);