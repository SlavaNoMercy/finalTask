({
   moveCars:function(component,event,helper) {
    helper.fireComponentEvent(component, event, "cars");
    window.scrollTo({top: 0,behavior: "smooth"});
   },
   moveQuestion:function(component,event,helper) {
    window.scrollTo({top: 0,behavior: "smooth"});
    helper.fireComponentEvent(component, event, "question");
   },
   moveTestDrive:function(component,event,helper) {
    helper.fireComponentEvent(component, event, "testDrive");
    window.scrollTo({top: 0,behavior: "smooth"});
   },
   moveServices:function(component,event,helper) {
      helper.fireComponentEvent(component, event, "testDrive");
      window.scrollTo({top: 0,behavior: "smooth"});
   }
})