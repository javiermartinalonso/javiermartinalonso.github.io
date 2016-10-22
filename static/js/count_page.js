$(document).ready(function() {
    $.ajax({
        type: "get",
        async: false,
        url: "http://{{ site.counter.name }}-a.leanapp.cn/api/{{ site.counter.name }}_count",
        dataType: "jsonp",
        jsonp: "callback",
        jsonpCallback: "flightHandler",
        success: function(json) {
            console.log('success');
        },
        error: function() {
            console.log('error');
        }
    });
});
