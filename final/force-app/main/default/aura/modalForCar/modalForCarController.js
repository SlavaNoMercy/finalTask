({
  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
    const action = component.get("c.selectProductFamily");
    let family = component.get("v.car").Product2.Family;
    console.log(family);
    action.setParams({ newFamily: family});
    action.setCallback(this, function(response) {
      console.log(response.getReturnValue());
  });
    $A.enqueueAction(action);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  submitDetails: function (component, event, helper) {
    const urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
    "url":"https://slava-nomercy-developer-edition.ap27.force.com/lada/formPDFForCar?language="+$A.get("$Locale.language")
    });
    urlEvent.fire();
  }
});
