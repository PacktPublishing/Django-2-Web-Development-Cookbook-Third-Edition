jQuery(function($) {
    var $list = $(".object-list");
    var $loader = $("script[type='text/template'].loader");

    $list.jscroll({
        loadingHtml: $loader.html(),
        padding: 100,
        pagingSelector: '.pagination',
        nextSelector: 'a.next_page:last',
        contentSelector: '.item,.pagination'
    });
});
