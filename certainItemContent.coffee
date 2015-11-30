setDownTextAreTextMain = null

goalUrl = localStorage.getItem('goalUrl')

onReady = ->
  urlsT = $('.floor-wrap>div.bd:first a:first')

  if urlsT.length == 0 || urlsT.attr('href').indexOf('try.taobao.com/report/report_detail.htm') == -1
#    chrome.extension.sendMessage({type: 'certToMain', data: 'no link'})
    close()
    return


  url = urlsT?.attr('href')

  window.scrollTo(0, document.body.scrollHeight)

  goalText = ''

  $('#submitBtn').on('click', ->
    setTimeout(
      ->
        chrome.extension.sendMessage({type: 'certToMain', data: goalText})
        close()

    , 1000)
  )

  win = open(url)


  chrome.extension.sendMessage({type: 'cert'})

  setDownTextAreText = (text)->
    textT = text + ',麻烦回赞，' + goalUrl
    # + $('.goalUrlM', opener.document).val().trim()

    $($('iframe')[0].contentWindow.document.getElementById('editorbodyid')).text(textT)
    goalText = textT

    setTimeout(
      ->
        $('#submitBtn')[0].click()

    , 1000
    )

  setDownTextAreTextMain = setDownTextAreText

myCommonToolsZ.fireActionByCusCondition(
  ->
    $('.floor-wrap>div.bd a:first').length != 0

,
  ->
#    chrome.extension.sendRequest({a: 'a'})
    onReady()
)

$('body').prepend('<input type="text" id="goalUrlText"></input>')

myCommonToolsZ.insertBtn('save',
  ->
    localStorage.setItem('goalUrl',$('#goalUrlText').val())
)

chrome.extension.onMessage.addListener(
  (obj)->
    if obj.action == 'doCert'

      setDownTextAreTextMain(obj.data)
)
