$(document).on('click', '.rating', function(){
  var id = $(this).attr('data-id');
  var user_action = $(this).attr("data-value");
  $.ajax({
      url: '/movies/rating',
      type: 'get',
      data: { id: id,user_action:user_action },
      success: function(data) {
      	var movie_id = data.movie_id;
        $("."+data.movie_id+"_rating").css( 'color', 'red' );
        $("."+data.movie_id+"_rating").css( 'cursor', 'crosshair' );
        $("."+data.movie_id+"_rating").css("pointer-events", "none");
      }
  });
});