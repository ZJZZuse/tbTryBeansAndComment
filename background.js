// Generated by CoffeeScript 1.10.0
(function() {
  var certTabId, doCert, doComm, doMain, mainTabId;

  mainTabId = null;

  certTabId = null;

  doMain = function(obj) {
    return mainTabId = obj.data;
  };

  doCert = function(obj) {
    return certTabId = obj.data;
  };

  doComm = function(obj) {
    return chrome.tabs.sendMessage(certTabId, {
      action: 'doCert'
    });
  };

  chrome.extension.onMessage.addListener(function(obj, sender) {
    switch (obj.type) {
      case 'main':
        return mainTabId = sender.tab.id;
      case 'cert':
        return certTabId = sender.tab.id;
      case 'doComm':
        return chrome.tabs.sendMessage(certTabId, {
          action: 'doCert',
          data: obj.data
        });
    }
  });

}).call(this);

//# sourceMappingURL=background.js.map
