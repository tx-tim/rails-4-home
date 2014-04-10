console.log("email-signup");

$(function(){
    if( $('#email-signup-submit').length ){
        console.log("email element found");

        $('#email-signup-submit').click(function(){
            console.log(Modernizr.mq('(min-width: 991px)') )

            if( Modernizr.mq('(min-width: 991px)') ){
                console.log("drop a modal");
                $('.offcanvas-email-form').modal();

            }
            else{
                console.log("try a slide thing");
                // $('.offcanvas-email-form')
                //.removeClass('modal')
                // .removeClass('fade')
                // .detach()
                // .appendTo('.email-signup')
                // .show();
                $('.offcanvas-email-form .modal-content')
                .detach()
                .prependTo('.footer-brands-section')
                .show();
                
            }


           return false; 
        });
    }
});