({
  callToServer: function (component, method, callback) {
    let action = component.get(method);
    action.setCallback(this, function (response) {
      let state = response.getState();
      if (state === "SUCCESS") {
        callback.call(this, response.getReturnValue());
      } else if (state === "ERROR") {
        let errors = response.getError();
        console.error(errors);
        alert("Problem with connection." + errors);
      }
    });
    $A.enqueueAction(action);
  }
});
