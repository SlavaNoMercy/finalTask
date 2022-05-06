({
  doInit: function (component, event, helper) {
    const action = component.get("c.getActualCarList");
    action.setCallback(component, function (response) {
      const state = response.getState();
      console.log(response);
      if (state === "SUCCESS") {
        component.set("v.cars", response.getReturnValue());
      } else {
        console.log("Failed with state: " + state);
      }
    });
    $A.enqueueAction(action);
  }
});
