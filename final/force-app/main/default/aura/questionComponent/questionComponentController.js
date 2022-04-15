({
  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  createCase: function (component, event, helper) {
    var newCase = component.get("v.newCase");

    var subjectField = component.find("subject");
    newCase.subject = subjectField.get("v.value");

    var emailField = component.find("email");
    newCase.suppliedEmail = emailField.get("v.value");

    var descriptionField = component.find("description");
    newCase.description = descriptionField.get("v.value");

    var status = component.get("v.newCase.Status");
    newCase.Status = status;

    var origin = component.get("v.newCase.Origin");
    newCase.Origin = origin;

    helper.createCase(component, JSON.stringify(newCase));
    console.log(JSON.stringify(newCase));
    component.set("v.isModalOpen", false);
  }
});
