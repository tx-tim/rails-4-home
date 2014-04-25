//console.log("home js")

$(function(){
    // use try catch block in case Modernizr doesn't load
    try{
        if(Modernizr.multiplebgs){
            $(".bg-image-wrapper").imagecover();
        }
        else{
            throw ('multiplebgs not supported')
        }
    }
    catch(er){
        $(".bg-image").hide();
    }
});