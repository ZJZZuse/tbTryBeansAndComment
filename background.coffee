

doMain = (obj)->
  window.callBackForMain = obj.data

doCert = (obj)->
  window.setDownTextAreText = obj.data

doComm = (obj)->
  window.setDownTextAreText(obj.data)


chrome.extension.onMessage.addListener(
  (obj)->
    switch obj.type
      when 'main' then doMain(obj)
      when 'cert' then doCert(obj)
      when 'doComm' then doComm(obj)
)

#chrome.extension