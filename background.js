// Generated by CoffeeScript 1.10.0
(function() {
  var doCert, doComm, doMain;

  doMain = function(obj) {
    return window.callBackForMain = obj.data;
  };

  doCert = function(obj) {
    return window.setDownTextAreText = obj.data;
  };

  doComm = function(obj) {
    return window.setDownTextAreText(obj.data);
  };

  chrome.extension.onMessage.addListener(function(obj) {
    switch (obj.type) {
      case 'main':
        return doMain(obj);
      case 'cert':
        return doCert(obj);
      case 'doComm':
        return doComm(obj);
    }
  });

}).call(this);

//# sourceMappingURL=background.js.map
