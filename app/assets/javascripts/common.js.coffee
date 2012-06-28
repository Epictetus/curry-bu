$ ->
  # escape
  $.escapeHTML = (val) ->
    $('<div/>').text(val).html()
