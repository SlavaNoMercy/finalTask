({
  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  createCase: function (component, event, helper) {
    let newCase = component.get("v.newCase");

    let subjectField = component.find("subject");
    newCase.subject = subjectField.get("v.value");

    let emailField = component.find("email");
    newCase.suppliedEmail = emailField.get("v.value");

    let descriptionField = component.find("description");
    newCase.description = descriptionField.get("v.value");

    helper.createCase(component, JSON.stringify(newCase));
  }
});
