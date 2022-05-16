({
    topFunction:function(component,event,helper) {
        console.log('works1'); 
        helper.fireComponentEvent(component, event, "home");
        window.scrollTo({top: 0,behavior: "smooth"});
        console.log('works2');
   }
})