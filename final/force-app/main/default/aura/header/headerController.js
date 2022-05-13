({
  doInit: function(component,event,helper) {
    // helper.selectComponent(component,"home",component.get("v.currentPage"));
    // console.log('here');

    //helper.mapClasses(component,["home","cars","services","question","testDrive"],"changeMe")
  },

  home: function (component, event, helper) {
    //helper.selectComponent(component,"home",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "home");
    event.preventDefault();
    history.replaceState(null, '', "lada");
  },
  cars: function (component, event, helper) {
    //helper.selectComponent(component,"cars",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "cars");
    event.preventDefault();
    history.replaceState(null, '', "cars");
  },
  services: function (component, event, helper) {
    //helper.selectComponent(component,"services",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "services");
    event.preventDefault();
    history.replaceState(null, '', "services");
  },
  question: function (component, event, helper) {
    //helper.selectComponent(component,"question",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "question");
    event.preventDefault();
    history.replaceState(null, '', "question");
  },
  testDrive: function (component, event, helper) {
    //helper.selectComponent(component,"testDrive",component.get("v.currentPage"));
    helper.fireComponentEvent(component, event, "testDrive");
    event.preventDefault();
    history.replaceState(null, '', "testDrive");
  }
});
