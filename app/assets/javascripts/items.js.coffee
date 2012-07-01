$ ->
  # いいね！
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

  # お店登録
  $('btn#shop-save').click ->
    name = $('input[name="shop[name]"]#shop_name').val()
    url = $('input[name="shop[url]"]#shop_url').val()
    address = $('input[name="shop[address]"]#shop_address').val()

    data = {
      'utf8': '✓'
      'shop[name]': name
      'shop[url]': url
      'shop[address]': address
    }

    $.post '/shops/modal.json', data, ->
      return
    # 登録に成功した場合はセレクトボックスに反映し、モーダルを閉じる
    .success (res)->
      shop_id = res.id
      shop_name = res.name

      $('#item_shop_id')
        .append $('<option>')
          .attr({ value: shop_id })
          .text(shop_name)
      $('#item_shop_id').val(shop_id)

      $('input[type="text"]#shop-form').val('')
      $('#create-shop').modal('hide')

    # エラーの場合はモーダルにバリデーションエラーを表示する
    .error (res)->
      $('#shop-errors').show()
      $('#shop-errors-list').empty()
      errors = JSON.parse(res.responseText)
      $.each errors, (name, error) ->
        # FIXME: json で渡されるエラーの項目名が日本語ではないので
        # js で出し分けを行なっている。二度手間になっているので改善したい。
        label = switch name
          when 'name' then '名前'
          when 'url' then 'URL'
          when 'address' then '住所'

        $('<li></li>').
          append(label + error[0]).
          appendTo('ul#shop-errors-list')
