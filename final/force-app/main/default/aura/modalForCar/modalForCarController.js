({
  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  submitDetails: function (component, event, helper) {
    const family = component.get("v.car").Product2.Family;
    const urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
    "url":"https://slava-nomercy-developer-edition.ap27.force.com/lada/formPDFForCar"
    });
    urlEvent.fire();
    //window.location.href = "https://slava-nomercy-developer-edition.ap27.force.com/lada/formPDFForCar";
  }
});
