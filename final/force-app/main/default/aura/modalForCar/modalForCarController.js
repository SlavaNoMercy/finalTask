({
  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  submitDetails: function (component, event, helper) {
    //component.set("v.isModalOpen", false);
    window.location.href = "https://slava-nomercy-developer-edition.ap27.force.com/lada/formPDFForCar";
  }
});
