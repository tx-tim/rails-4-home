console.log("promo image js")

$(function(){
    //$(".heavy-promos .fitimage").imagecover();
    var calcImageHt = function(){
        return $(".heavy-promos").height();
    }

    $(".heavy-promos .promos-image-wrapper").height(calcImageHt);
    
    $(window).resize(function(){
        calcImageHt = $(".heavy-promos").height();
        $(".heavy-promos .promos-image-wrapper").height(calcImageHt);
    })

    $(".heavy-promos .promos-image-wrapper").imagecover();

    //imagecover();
});
