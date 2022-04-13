({
  removeCSS: function (cmp, event, help) {
    var cmpTarget = cmp.find("MainDiv");
    $A.util.removeClass(cmpTarget, "slds-modal__container");
  }
});
