# Title: Flickr tag for Jekyll
# Author: Zachary Zadel http://zadell.com
# Description: Outputs a flickr image given an id
#
# Syntax {% flickr id %}
#

module Jekyll
require 'net/http'
require 'json'
  class FlickrTag < Liquid::Tag
    @flickr_id = nil

    def initialize(tag_name, markup, tokens)
      if markup =~ /(\d+)?/i
        @flickr_id  = $1
        @flickr_api_key = '99ec590d0a9937053b6aa5049ed35e51'
        @response = Net::HTTP.get_response(URI("http://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=#{@flickr_api_key}&photo_id=#{@flickr_id}&format=json&nojsoncallback=1"))
        @response = JSON.parse(@response.body)
        @photo = @response["photo"]
        @url = "http://farm#{@photo['farm']}.static.flickr.com/"+@photo['server']+"/"+@photo['id']+"_"+@photo['secret']+"_b."+@photo['originalformat']
        @photo_url = @photo["urls"]["url"][0]["_content"]
        @description = @photo["description"]["_content"]
      end
      super
    end

    def render(context)
      output = super
      if @flickr_id
        flickr =  "<div class='image' id='#{@flickr_id}'>"
        flickr += "<a href=#{@photo_url}>"
        flickr += "<img class='center' src='#{@url}'>"
        flickr += "</a>"
        flickr += "<h2><span>#{@photo['title']['_content']}</span></h2>"
        flickr += "</div>"
      else
        "Error processing input, expected syntax: {% flickr id %}"
      end
    end
  end
end

Liquid::Template.register_tag('flickr', Jekyll::FlickrTag)


