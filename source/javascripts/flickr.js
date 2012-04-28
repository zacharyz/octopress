jQuery(document).ready(function(){
  jQuery(".image").hover(
    function () {
      jQuery(this).find("h2").stop().fadeIn('fast');
    }, 
    function () {
      jQuery(this).find("h2").stop().fadeOut('fast');
    }
  );
  jQuery(".image").each(function() {
    var apiKey = '99ec590d0a9937053b6aa5049ed35e51';
    var photoID = jQuery(this).attr('id');
    var container= jQuery(this);
    jQuery.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key='+apiKey+'&photo_id='+photoID+'&format=json&nojsoncallback=1',
      function(data){
        var photo = data.photo;
        console.log(photo.urls.url[0]._content);
        var url = 'http://farm' + photo.farm + '.static.flickr.com/' + photo.server + '/' + photo.id + '_' + photo.secret+'_b.'+photo.originalformat;
        var photo_url = photo.urls.url[0]._content;
        container.append(jQuery('<a href='+photo_url+'></a>')
                                .append('<img class="center" src='+url+'>')
        );
                                
        container.append("<h2><span>"+photo.title._content+"</span></h2>");
      });
   });

});

