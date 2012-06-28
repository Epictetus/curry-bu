$ ->
  # thumbnails
  $container = $('.thumbnails')
  $container.imagesLoaded ->
    $container.masonry itemSelector : '.span3'


  # tags
  $('input#tags').tagsInput
    removeWithBackspace: false
    width: '200px'
    onAddTag: (value) ->
      url = shopUrl()
      $.post url, { tag_name: value }, (res) ->
        printTags(res)
    onRemoveTag: (value) ->
      url = shopUrl()
      $.post url, { _method: 'delete', tag_name: value }, (res) ->
        printTags(res)

  # お店の URL を取得
  shopUrl = ->
    id = $('#data-info').attr('data-shop-id')
    '/shops/' + id + '/tags'

  # 取得したタグを出力
  printTags = (res) ->
    $('ul#tag-list').text('')
    $.each res.data, (index, name) ->
      name = $.escapeHTML(name)
      $('<li></li>').
        append(name).
        appendTo('ul#tag-list')

