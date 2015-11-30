onReady = ->
  window.scrollTo(0, document.body.scrollHeight)

  textT = "很好的报告哦~#{ myCommonToolsZ.repeatStr('~', (Math.random() * 10).toFixed())}"

  textT = textT.trim()

  setTimeout(
    ->
      $('.f-txt').val(textT)
      $('.J_PostComment')[0].click()
      $('.J_Dig')[0].click()

  , 500)


  myCommonToolsZ.fireActionByCusCondition(
    ->
      t = $('.comment-list>li:first .words')

      t.length != 0 && t.text().trim().indexOf(textT) != -1
  ,
    ->
#    chrome.extension.sendRequest({a: 'a'})
      sayer = $('.comment-list>li:first .words>a').text().trim()

      $('.comment-list>li:first .words>a').remove()

      setStrT = ->
        backText = $('.J_CancelDig').text().trim() + ',' + $('.comment-list>li:first .words').text().trim() + ' @' + $('.comment-list>li:first .time').text().trim() + ' by ' + sayer

#        chrome.extension.getBackgroundPage().setDownTextAreText(backText)

        chrome.extension.sendMessage({type: 'doComm', data: backText})

        setTimeout(
          ->
            close()
        , 1000)

      myCommonToolsZ.fireActionByCusCondition(
        ->
          $('.J_CancelDig').length != 0 && $('.comment-list>li:first .words').length != 0 && $('.comment-list>li:first .time').length != 0
      ,

        setStrT
      )
  )


myCommonToolsZ.fireActionByCusCondition(
  ->
    $('.J_Dig').length != 0 && $('.J_PostComment').length != 0

,
  ->
#    chrome.extension.sendRequest({a: 'a'})
    onReady()
)

