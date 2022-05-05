({
  openModel: function (component, event, helper) {
    component.set("v.isModalOpen", true);
  },

  closeModel: function (component, event, helper) {
    component.set("v.isModalOpen", false);
  },

  createLead: function (component, event, helper) {
    let newLead = component.get("v.newLead");

    let subjectField = component.find("subject");
    newLead.subject = subjectField.get("v.value");

    let emailField = component.find("email");
    newLead.suppliedEmail = emailField.get("v.value");

    let descriptionField = component.find("description");
    newLead.description = descriptionField.get("v.value");

    let status = component.get("v.newLead.Status");
    newLead.Status = status;

    let lastNameField = component.find("lastname");
    newLead.LastName = lastNameField.get("v.value");

    let company = component.get("v.newLead.Company");
    newLead.Company = company;

    let source = component.get("v.newLead.LeadSource"); 
    newLead.LeadSource = source;

    helper.createLead(component, JSON.stringify(newLead));
    console.log(JSON.stringify(newLead));
    component.set("v.isModalOpen", false);
  },

  doInit: function (component, event, helper) {
    let action = component.get("c.getActualCarList");
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
