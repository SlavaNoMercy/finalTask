({
  createCase: function (component, caseStr) {
    let action = component.get("c.saveCase");
    action.setParams({
      Case: caseStr
    });

    $A.enqueueAction(action);
  }
});
