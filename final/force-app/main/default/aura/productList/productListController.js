({
  doInit: function (component, event, helper) {
    const action = component.get("c.getCarsList");
    let currency = component.get("v.currency");
    console.log(currency);
    action.setParams({ selectedCurrency : currency });
    action.setCallback(component, function (response) {
      const state = response.getState();
      if (state === "SUCCESS") { 
        component.set("v.cars", response.getReturnValue());
        console.log(component.get("v.cars"));
        helper.showSlides(component,component.get("v.slideNumber"));//
      } else {
        console.log("Failed with state: " + state);
      }
    });
    $A.enqueueAction(action);
  },
  slidePlus: function(component,event,helper){
    let i = parseInt(component.get("v.slideNumber")) + 1;
    const slides = component.get("v.cars");
    if (i > slides.length-1) {i = 0}
    component.set("v.slideNumber",i);
    console.log(i);
    helper.showSlides(component,i);
  },
  slideMinus: function(component,event,helper){
    let i = parseInt(component.get("v.slideNumber")) - 1;
    const slides = component.get("v.cars");
    if (i < 0 ) {i = slides.length-1}
    component.set("v.slideNumber",i);
    console.log(i);
    helper.showSlides(component,i);
  },
  handleCapture: function(component,event,helper){
    console.log("got event, parameter: " + event.getParam("currency"));
    component.set("v.currency",event.getParam("currency"));
    $A.enqueueAction(component.get("c.doInit"));
  }
});
