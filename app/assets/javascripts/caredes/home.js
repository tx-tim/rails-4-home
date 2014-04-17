console.log("home js")

$(function(){
    try{
        $(".bg-image-wrapper").imagecover();
    }
    catch(er){
        $(".bg-image").hide();
        console.log(er);
    }
});