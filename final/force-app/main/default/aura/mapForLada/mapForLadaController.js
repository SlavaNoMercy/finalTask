({
  doInit: function (component, event, helper) {
    try {
      helper.callToServer(
        component,
        "c.findServicesForMap",
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
              description: completeAddress.join()
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
