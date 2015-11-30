setTimeout(
  ->
    chrome.extension.sendMessage({type: 'certToMain',data:'normal close'})

    close()
,
  500)
