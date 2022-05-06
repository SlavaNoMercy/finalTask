({
  doInit: function (component, event, helper) {
    try {
      helper.callToServer(
        component,
        "c.getServices",
        function (response) {
          let markers = [];
          for (let i = 0; i < response.length; i++) {
            let service = response[i];
            let completeAddress = [];
            if (service.Latitude) {
              completeAddress.push(service.Latitude__c);
            }
            if (service.Longitude) {
              completeAddress.push(service.Longitude__c);
            }
            markers.push({
              location: {
                Latitude: service.Latitude__c,
                Longitude: service.Longitude__c
              },
              icon: "standard:account",
              title: service.Name,
              description:
                "<p> Address: " +
                service.Address__c +
                "</p>" +
                "<p> Phone: " +
                service.Contact_Number__c +
                "</p>" +
                "<p> Working Hours: " +
                service.Working_Hours__c +
                "</p>"
            });
          }
          component.set("v.markersTitle", "All Service Locations");
          component.set("v.mapMarkers", markers);
          component.set("v.center", {
            location: {
              Latitude: "53.89533065891396",
              Longitude: "27.56046445640155"
            }
          });
          component.set("v.listView", "hidden");
        }
      );
    } catch (e) {
      System.debug(
        LoggingLevel.ERROR,
        "The following exception has occurred: " + e.getMessage()
      );
    }
  }
});
