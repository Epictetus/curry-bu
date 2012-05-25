jQuery ->
  ()->
    $container = $('.thumbnails')
    $container.imagesLoaded $container.masonry itemSelector : '.span3'
