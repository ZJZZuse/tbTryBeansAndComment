onReady = ->
  urlsT = $('.floor-wrap>div.bd:first a:first')

  if urlsT.length == 0 || urlsT.attr('href').indexOf('try.taobao.com/report/report_detail.htm') == -1

    callBackT(null, 'no efficacious link')
    close()


  url = urlsT?.attr('href')

  window.scrollTo(0, document.body.scrollHeight)

  goalText = ''

  $('#submitBtn').on('click', ->
    setTimeout(
      ->

        callBackT(null, goalText)
        close()

    , 1000)
  )

  win = open(url)

  win.setDownTextAreText = setDownTextAreText

  setDownTextAreText = (text)->

    textT = text + ',麻烦回赞，' + $('.goalUrlM',opener.document).val().trim()

    $($('iframe')[0].contentWindow.document.getElementById('editorbodyid')).text(textT)
    goalText = textT


myCommonToolsZ.fireActionByCusCondition(
  ->
    $('.floor-wrap>div.bd a:first').length != 0

,
  ->
#    chrome.extension.sendRequest({a: 'a'})
    onReady()
)


