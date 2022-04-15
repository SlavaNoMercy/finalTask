({
  createLead: function (component, leadStr) {
    let action = component.get("c.saveLead");
    action.setParams({
      Lead: leadStr
    });

    $A.enqueueAction(action);
  }
});
