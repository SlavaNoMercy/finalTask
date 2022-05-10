({
  doInit: function (component, event, helper) {
   // const family = component.get("v.car");
   // const selectValue = family.Family.split(' ');
    //component.set("v.family",selectValue[0]);
    component.set("v.family","Niva");
    console.log(component.get("v.car"));
  }
});
