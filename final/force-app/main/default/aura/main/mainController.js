({
  doInit: function(component,event,helper){
    //document.cookie = "page=home";
    if (document.cookie.split(';').filter(function(item) {
      item.trim().indexOf('page=') == 0}).length) {
      let cookiePage = document.cookie.replace(/(?:(?:^|.*;\s*)page\s*\=\s*([^;]*).*$)|^.*$/, "$1");
      component.set("v.renderedCmp", cookiePage);  
    }
    else {
      document.cookie = "page=home";
    }
  },

  handleComponentEvent: function (component, event, helper) {
    document.cookie = "page=" + event.getParam("message");
    component.set("v.renderedCmp", event.getParam("message")); 
  }
});
