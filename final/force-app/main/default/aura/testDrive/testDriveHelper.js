({
  createCase: function (component, caseStr) {
    let action = component.get("c.LadaCaseController");
    action.setParams({
      case: caseStr
    });

    $A.enqueueAction(action);
  }
});
