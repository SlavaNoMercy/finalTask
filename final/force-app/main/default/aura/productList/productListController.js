({
  doInit: function (component, event, helper) {
    const action = component.get("c.getActualCarList");
    action.setCallback(component, function (response) {
      const state = response.getState();
      //console.log(response);
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
  }
});
