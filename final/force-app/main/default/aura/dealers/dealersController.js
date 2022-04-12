({
  doInit: function (component, event, helper) {
    let action = component.get("c.getDealers");
    action.setCallback(this, function (response) {
      let state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.dealers", response.getReturnValue());
      } else {
        console.log("Failed with state: " + state);
      }
    });
    $A.enqueueAction(action);
  }
});
