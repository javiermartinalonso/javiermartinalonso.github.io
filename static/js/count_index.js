$(document).ready(function () {
/*
    pre_content = $("#javiermartinalonso_site_pv").html();
    $("#javiermartinalonso_site_pv").html(pre_content);
    $.ajax({
        url: "https://api.leancloud.cn/1.1/classes/Count",
        type: "GET",
        cache: false,
        headers: {
            "X-LC-Id": "vAMFua5yim32gEb0BgyaUPtw-gzGzoHsz",
            "X-LC-Key": "nsyfA4qrY3UQsOe7JP6xvUxo",
            "Content-Type": "application/json"
        },
        params: {
            "where": {"website": "{{ site.url }}"}
        },
        success: function(data, textStatus, jqXHR)
        {
            // console.log('get success');
            // console.log(data);
            var website_count = data.results[0].count + 1;
            var website_id = data.results[0].objectId;
            $("#javiermartinalonso_site_pv").html('<span class="navy">' + website_count + '</span>&nbsp;<span data-i18n="link.view">views</span>&nbsp;||&nbsp;' + pre_content);
            var dataForm = {
                "website": "{{ site.url }}",
                "count": website_count
            };
            $.ajax({
                url: "https://api.leancloud.cn/1.1/classes/Count/" + website_id,
                type: "PUT",
                // cache: false,
                headers: {
                    "X-LC-Id": "vAMFua5yim32gEb0BgyaUPtw-gzGzoHsz",
                    "X-LC-Key": "nsyfA4qrY3UQsOe7JP6xvUxo",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify(dataForm),
                success: function(data, textStatus, jqXHR)
                {
                    // console.log('update success');
                    // console.log(data);
                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    console.log(textStatus);
                }
            });
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            console.log(textStatus);
        }
    });
*/
});
