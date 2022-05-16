({
  doInit: function(component,event,helper) {
    
  },
  home: function (component, event, helper) {
    helper.selectComponent(component,"home",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "home");
    component.set("v.currentPage","home");
  },
  cars: function (component, event, helper) {
    helper.selectComponent(component,"cars",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "cars");
    component.set("v.currentPage","cars");
  },
  services: function (component, event, helper) {
    helper.selectComponent(component,"services",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "services");
    component.set("v.currentPage","services");
  },
  question: function (component, event, helper) {
    helper.selectComponent(component,"question",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "question");
    component.set("v.currentPage","question");
  },
  testDrive: function (component, event, helper) {
    helper.selectComponent(component,"testDrive",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "testDrive");
    component.set("v.currentPage","testDrive");
  }
});
