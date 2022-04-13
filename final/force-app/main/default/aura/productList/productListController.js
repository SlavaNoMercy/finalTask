({
  doInit: function (component, event, helper) {
    let action = component.get("c.getProduct");
    action.setCallback(this, function (response) {
      let state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.cars", response.getReturnValue());
      } else {
        console.log("Failed with state: " + state);
      }
    });
    $A.enqueueAction(action);
  }
});
