({
    showSlides : function(component,slideNumber) {
        let i;
        let slides = component.get("v.cars");
        console.log(slideNumber,slides.length);
        console.log(slides[slideNumber]["Id"]);
        //if (slideNumber > slides.length) {slideNumber = 1}
        // if (slideNumber < 1) {slideNumber = slides.length-1}
        component.set("v.slideNumber",parseInt(slideNumber));
        for (i = 0; i < slides.length; i++) {
            slides[i]["slideNumber"] = i;
          let divId = document.getElementById(slides[i]["Id"]);
          console.log(divId);
          $A.util.removeClass(divId,"seeMe");
          if(i==slideNumber){
             $A.util.addClass(divId,"seeMe");
            }          
        }
        component.set("v.cars",slides);
        console.log("GGGG:" ,slides);
        console.log(slideNumber);  
    }
})