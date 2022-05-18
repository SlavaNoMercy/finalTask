({
  handleComponentEvent: function (component, event, helper) {
    component.set("v.renderedCmp", event.getParam("message")); 
  }
  // changeCurrency: function(component,event,helper) {
  //   //console.log("got event, parameter: " + event.getParam("currency") )
  //   component.set("v.currency", event.getParam("currency"));
  // }
});
