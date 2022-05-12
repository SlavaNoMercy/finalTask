({
  fireComponentEvent: function (cmp, event, cmpName) {
    let cmpEvent = cmp.getEvent("cmpEvent");
    cmpEvent.setParams({
      message: cmpName
    });
    cmpEvent.fire();
  },

  // selectComponent: function (cmp, cmpName, previousPage){
  //   let cmpTarget = cmp.find(cmpName);
  //   $A.util.addClass(cmpTarget, 'changeMe');
  //   console.log(previousPage);
  //   $A.util.removeClass(previousPage, 'changeMe');
  //   console.log('style applied!');
  //   cmp.set("v.currentPage",cmpName);
  // },

  mapClasses: function(component,arr, cssClass) {
    for(let cmp in arr) {
        $A.util.toggleClass(component.find(arr[cmp]), cssClass);
        console.log(arr[cmp]);
    }
  }
});
