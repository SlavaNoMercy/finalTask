({
  fireComponentEvent: function (cmp, event, cmpName) {
    let cmpEvent = cmp.getEvent("cmpEvent");
    cmpEvent.setParams({
      message: cmpName
    });
    cmpEvent.fire();
  },

  selectComponent: function (cmp, cmpName, previousPage){
    console.log(previousPage);
    let cmpPrevTarget = cmp.find(previousPage)
    $A.util.removeClass(cmpPrevTarget, 'active');
    let cmpTarget = cmp.find(cmpName);
    $A.util.addClass(cmpTarget, 'active');
    console.log('style applied!');
    cmp.set("v.currentPage",cmpName);
  },

  fireCurrChangeEvent: function(component,currency){
    let event = $A.get("e.c:currChangeEvent");
    event.setParams({
      currency: currency
    });
    event.fire();
    console.log("event fired, parameter: " + currency);
  }
});
