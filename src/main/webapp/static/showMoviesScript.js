$(function(){
    $(".showFavorite").on('click', function () {
        $(".isFavorite").addClass('hidden');
        $(".isWatched").removeClass('hidden');
        $(".showWatched").removeClass('active')
        $(".showAll").removeClass('active')
        $(this).addClass("active");
    });
    $(".showWatched").on('click', function () {
        $(".isWatched").addClass('hidden');
        $(".isFavorite").removeClass('hidden');
        $(".showFavorite").removeClass('active')
        $(".showAll").removeClass('active')
        $(this).addClass("active");
    });
    $(".showAll").on('click', function () {
        $(".isWatched").removeClass('hidden');
        $(".isFavorite").removeClass('hidden');
        $(".showFavorite").removeClass('active')
        $(".showWatched").removeClass('active')
        $(this).addClass("active");
    });
});
