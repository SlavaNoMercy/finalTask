({
  doInit: function(component,event,helper) {
    console.log($A.get("$Locale.currency"))    
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
  },
  selectCurrency: function(component,event,helper){
    console.log(event);
    console.log(event.target.value);
    console.log(event.data);
    alert(component.find("selected-currency").value);
  },
  selectLanguage: function(component,event,helper){
    console.log(event);
    console.log(event.target);
    console.log(event.data);
    alert(component.find("selected-language").value);
    console.log(component.find("selected-language").value);
  },
  applyClasses: function(component,event,helper){
    let navItem = component.find("navigation");
    $A.util.toggleClass(navItem,"notresponsive");
    $A.util.toggleClass(navItem,"responsive");
    // if (navItem.className === "navbar notresponsive") {
    //   navItem.className = "navbar responsive";
    //   console.log(navItem);
    //   console.log(navItem.className);
    // } else {
    //   navItem.className = "navbar notresponsive";
    // }
  }
});
