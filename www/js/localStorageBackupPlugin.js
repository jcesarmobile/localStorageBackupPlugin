 (function(window) {
  var LSBPlugin = function() {
  
  }
  
  LSBPlugin.prototype = {
    initPlugin : function() {
        cordova.exec(null, null, "localStorageBackupPlugin", "initPlugin",[]);
    },
    getBackup: function(callback, errCallbac) {
        cordova.exec(callback, errCallbac, "localStorageBackupPlugin", "getBackup",[]);
    },
    getAllLS: function (callback, errCallbac) {
        var allLS = new Array();
        for ( var i = 0, len = localStorage.length; i < len; ++i ) {
  
            var lsOjbect =new Object();
            lsOjbect.key=localStorage.key(i);
            lsOjbect.value = localStorage.getItem(localStorage.key(i));
            allLS.push(lsOjbect);
        }
        return JSON.stringify(allLS);
    }
  };
  
  cordova.addConstructor(function() {
    window.LSBPlugin = new LSBPlugin();
  });
  
})(window);
