({
   topFunction:function(component,event,helper) {
    console.log('works1'); 
    helper.fireComponentEvent(component, event, "home");
    window.scrollTo({top: 0,behavior: "smooth"});
    console.log('works2');
   },
   topFunctionQ:function(component,event,helper) {
    helper.fireComponentEvent(component, event, "question");
    window.scrollTo({top: 0,behavior: "smooth"});
   },
   topFunctionTD:function(component,event,helper) {
    helper.fireComponentEvent(component, event, "testDrive");
    window.scrollTo({top: 0,behavior: "smooth"});
   }
})