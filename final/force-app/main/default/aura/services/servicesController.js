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
  }
});
