({
  home: function (component, event, helper) {
    helper.fireComponentEvent(component, event, "home");
  },
  cars: function (component, event, helper) {
    helper.fireComponentEvent(component, event, "cars");
  },
  services: function (component, event, helper) {
    helper.fireComponentEvent(component, event, "services");
  },
  question: function (component, event, helper) {
    helper.fireComponentEvent(component, event, "question");
  },
  testDrive: function (component, event, helper) {
    helper.fireComponentEvent(component, event, "testDrive");
  }
});
