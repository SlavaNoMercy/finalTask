({
  doInit: function (component, event, helper) {
    let action = component.get("c.getServices");
    action.setCallback(this, function (response) {
      let state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.services", response.getReturnValue());
      } else {
        console.log("Failed with state: " + state);
      }
    });
    $A.enqueueAction(action);
  },

  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  submitDetails: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  }
});
