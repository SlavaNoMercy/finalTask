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
  }
});
