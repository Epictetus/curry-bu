$ ->
  $('span#toggle_like').click ->
    url = $('span#toggle_like a[href]').attr('href')
    $.ajax
      type: 'GET'
      url: url
      dataType: 'json'
      success: (data) ->
        $('span#likes_count').text(data.count)
        if data.status == 'create'
          $('span#toggle_like a[href]').text('いいね！を取り消す')
        else
          $('span#toggle_like a[href]').text('いいね！')

    false
