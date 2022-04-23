({
  fireComponentEvent: function (cmp, event, cmpName) {
    var cmpEvent = cmp.getEvent("cmpEvent");
    cmpEvent.setParams({
      message: cmpName
    });
    cmpEvent.fire();
  }
});
