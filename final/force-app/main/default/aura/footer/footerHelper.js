({
    fireComponentEvent: function (cmp, event, cmpName) {
        let cmpEvent = cmp.getEvent("cmpEvent");
        cmpEvent.setParams({
          message: cmpName
        });
        cmpEvent.fire();
      }
})