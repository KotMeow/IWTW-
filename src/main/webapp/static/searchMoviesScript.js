$(function () {
    var $rows = $(".item");
    $("#search").keyup(function() {
        var val = $.trim(this.value);
        if (val === "")
            $rows.show();
        else {
            $rows.hide();
            $rows.has("span:contains(" + val + ")").show();
            $rows.has("span:contains(" + val.charAt(0).toUpperCase() + val.slice(1) + ")").show();
        }
    });
})