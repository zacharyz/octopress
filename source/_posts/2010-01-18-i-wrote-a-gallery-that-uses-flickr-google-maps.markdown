---
author: dakry
date: '2010-01-18 22:16:49'
layout: post
slug: i-wrote-a-gallery-that-uses-flickr-google-maps
status: publish
title: I wrote a Gallery that uses Flickr + Google Maps
wordpress_id: '377'
published: false
categories:
- technology
---

[![](http://farm5.static.flickr.com/4009/4287010500_9a22620993.jpg)](http://za
dell.com/gallery/photo.php?id=3868448361)

I had been toying around with the idea of using the flickr api with google
maps for a while. So a couple of weekends ago I decided to take a break from
client work and hammer something out. The result is my [gallery](/gallery).
The goals for the project were the following:

## Use flickr's and google's map apis.

  
Both are apis that I have known about, and wanted to work with for a while,
but hadn't had chance to use on scale larger than minor wordpress widgets. In
the past my experience was limited to using jQuery to access my most recent
photos from flickr. I wanted something a bit more powerful and flexible and an
excuse to use php which my web host supports. I ended up settling on a
relatively good PHP wrapper called [phpflickr](phpflickr.com)

Displaying a map was surprisingly easy. Once I extracted the longitude and
latitude information from the photo I was able to use a couple google maps
function calls to create a map around that location with a marker on it.

## Create a way to display my photos in a meaningful way on my site

  
There are lots of gallery plugins and widgets around the net. I wanted
something though that was completely customizable both in how it displays
images and how it is used. For example - if I wanted to pull from a specific
set of photos, I can do that. Also if wanted to be able to mine data about my
photographic behaviors, such as what my favorite apertures and focal range
were - those are not typically available with "off the shelf" options.

The biggest problem with flickr itself is its white background which doesn't
work well with photography. I find it distracting and prefer a darker
background (hence the color scheme of this site). People often use sites like
that of [big huge labs](http://bighugelabs.com/) to display their picture on a
black background. I wanted to avoid having to use an external site.

I also wanted the ability to readily display information that I find important
- such as the camera, lens, aperture, iso, and shutter speed I used. I also
wanted to toy with the idea of showing (when available) the location of where
I took the photo on a google map.

Additionally I wanted to use some javascript to make it possible to expand the
photos, so that users will not need to leave the site to better view my
pictures. To achieve this I used a javascript library called [highslide
JS](http://highslide.com/).

The final result of my weekend coding session is a relatively minimalist
interface that gives the viewer all the information that I consider important.

