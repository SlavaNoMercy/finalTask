({
  handleComponentEvent: function (component, event, helper) {
    component.set("v.renderedCmp", event.getParam("message"));
  }
});
