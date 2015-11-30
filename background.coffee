mainTabId = null
certTabId = null

doMain = (obj)->
  mainTabId = obj.data

doCert = (obj)->
  certTabId = obj.data

doComm = (obj)->
  chrome.tabs.sendMessage(certTabId, {action: 'doCert'})


chrome.extension.onMessage.addListener(
  (obj, sender)->
    switch obj.type
      when 'main'
        mainTabId = sender.tab.id


      when 'cert'
        certTabId = sender.tab.id
      when 'doComm'

        chrome.tabs.sendMessage(certTabId, {action: 'doCert', data: obj.data})

#      when 'certToMain'
#        chrome.tabs.sendMessage(mainTabId, {action: 'doCertToMain',data:obj.data})
)

#chrome.extension