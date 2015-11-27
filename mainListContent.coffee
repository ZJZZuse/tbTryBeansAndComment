onReady = ->
  mainItems = $('table.posts:eq(1) tr>td.subject')

  effectiveUrls = []

  for ele in mainItems
    do (ele) ->
      if ( $(ele).find('.myPickCb')[0]['checked'] && $(ele).find('a').attr('href') != '')
        effectiveUrls.push($(ele).find('a').attr('href'))


  async.mapLimit(effectiveUrls, 1,
    (url, callback)->
      w = open(url)

      w.callBackT = callback

#      callBackT = ->
#        callback(null, url)


#      $(w.document.body).data('callbackT', ->
#        callback(null, url)
#      )

#      myCommonToolsZ.fireActionByCusCondition(
#        ->
#          w.closed
#      ,
#        ->
#          callback(null, url)
#      )

#      setTimeout(
#        ->
#          w.onunload = ->
#            callback(null, url)
#      , 100)


  , (err, result)->
    $("body").prepend("done,count is #{result.length}");
  )


addCB = ->
  $('table.posts:eq(1) tr:first').remove()


  $('table.posts:eq(1) tr .subject>.detail').after(' <input type="checkbox" class="myPickCb"/> ')


main = ->
  $("body").prepend('<button id = "myActionBtn">action</button>');

  $("body").prepend('<input type="text" class="goalUrlM" />');

  #  chrome.extension.onRequest.addListener(()->
  #    console.log('onRequest')
  #    #    callback(null, url)
  ##    callBackT()
  #  )

  setTimeout(
    ->
      $('button#myActionBtn').on('click',
        ->
          onReady()
      )
  , 3000)


main()

myCommonToolsZ.fireActionByCusCondition(
  ->
    $('table.posts:eq(1) tr:first').length != 0

,
  ->
#    chrome.extension.sendRequest({a: 'a'})
    addCB()
)
