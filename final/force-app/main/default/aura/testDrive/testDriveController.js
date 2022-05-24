({
  doInit: function (component, event, helper) {
    let action = component.get("c.getCarsList");
    action.setParams({selectedCurrency:'illegal value!!!'});
    action.setCallback(this, function (response) {
      let state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.options", response.getReturnValue());
      } else {
        console.log("Failed with state: " + state);
      }
    });
    $A.enqueueAction(action);
  }
});
