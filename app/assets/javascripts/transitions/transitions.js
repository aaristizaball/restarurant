var ii_transitions = {};
(function () {
    var roleName = 'main';
    var SELECTOR = 'a[transition-name]';
    var $loadEl = $('<div class="loading"><p id="spinner"/><h4>Cargando...</h4></div>');

    var contentRole = roleName;
    var defaultTransition = 'slide';

    var getContentHolder = function () {
            return $('[role=' + roleName + ']');
        };

    var transitionHandler = function (name, $to, $from, cb) {

            $from.addClass(name + ' out');

            $from.animationComplete(function () {
                $from.detach();
                getContentHolder().append($to);
                $to.addClass(name + ' in');
            });
            $to.animationComplete(function () {
                $to.removeClass(name + ' in');
                if ($.isFunction(cb)) {
                    cb();
                }
            });
        };

    var toggleLoading = function (isLoading, delay) {
            //return false;
            if (isLoading) {
                $('#container').prepend($loadEl);
                $loadEl.fadeIn('fast');
            } else {
                // Introduced a little delay for effect.
                setTimeout(function () {
                    $loadEl.fadeOut('fast', function () {
                        $loadEl.detach();
                    });
                }, delay || 0);
            }
        };

    var loadPageDone = function ($newPageContents, url, transition) {
            log(url);
            history.pushState({
                path: this.path
            }, '', url);
            var $oldContent = getContentHolder().children(),
                $newContent = $newPageContents,
                transitionName = transition || defaultTransition;

            transitionHandler(transitionName, $newContent, $oldContent, function () {
                toggleLoading(false);
                //ii_app.reset(); //Solve the Ajax bug AAL
            });
        };

    var pageLoadSettings = {
        type: "get",
        data: undefined,
        reloadPage: false,
        role: roleName,
        showLoadMsg: true
    };

    var loadPage = function (url, transition, options) {
            if (url != undefined && url != '') {
                toggleLoading(true);  //muestra la animación del loading

                var deferred = $.Deferred(),
                    settings = $.extend({}, pageLoadSettings, options),
                    page = null,
                    // The DOM element holder for the fetched page.
                    fileUrl = url; // Might want to massage the url in the future.
                $.ajax({
                    url: fileUrl,
                    type: settings.type,
                    data: settings.data,
                    dataType: "html",
                    success: function (html) {
                        var all = $('<div></div>'),
                            contentSelector = '[role=' + settings.role + ']';

                        //workaround to allow scripts to execute when included in page divs
                        all.get(0).innerHTML = html;

                        // Find the content in the other page.                  
                        if (!all.has(contentSelector)) {
                            deferred.reject(url, options);
                            return;
                        }

                        page = all.find('[role=' + settings.role + ']').first().contents();
                        deferred.resolve(page, fileUrl);
                        toggleLoading(false);
                        loadPageDone(page, url, transition);
                    },
                    error: function () {
                        // hide the loading message.
                        toggleLoading(false);
                        deferred.reject(url, options);
                    }
                    
                });

                return deferred.promise();
            }
        };

    this.init = function () {
        setupButtons();
        this.reset();
    };

    this.reset = function () {};

    var setupButtons = function () {
            if (Modernizr.csstransitions) {
                //animation complete callback
                $.fn.animationComplete = function (callback) {
                    if (Modernizr.csstransitions) {
                        return $(this).one('webkitAnimationEnd', callback);
                    } else {
                        // defer execution for consistency between webkit/non webkit
                        setTimeout(callback, 0);
                        return $(this);
                    }
                };

            }

            // Attach click handlers for all links with our special transition attribute.
            $('body').delegate(SELECTOR, 'click', function (e) {
                // Prevent navigation...
                e.preventDefault();
                var pageUrl = $(this).attr('href');
                var transition = $(this).attr('transition-name');
                loadPage(pageUrl, transition);
            });

        };

}).apply(ii_transitions);



// Log function, via html5 boilerplate.
window.log = function () {
    log.history = log.history || [];
    log.history.push(arguments);
    arguments.callee = arguments.callee.caller;
    if (this.console) console.log(Array.prototype.slice.call(arguments));
};
(function (b) {
    function c() {}
    for (var d = "assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","), a; a = d.pop();) b[a] = b[a] || c
})(window.console = window.console || {});
