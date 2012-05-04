jQuery(document).ready(function(){
  jQuery(".image").hover(
    function () {
      jQuery(this).find("h2").stop().fadeIn('fast');
    }, 
    function () {
      jQuery(this).find("h2").stop().fadeOut('fast');
    }
  );

});

