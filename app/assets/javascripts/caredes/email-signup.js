//console.log("email-signup");

$(function(){
    if( $('#email-signup-submit').length ){

        $('#email-signup-submit').click(function(event){

            if( Modernizr.mq('(min-width: 991px)') || document.body.clientWidth >= 991  ){
                try{
                    $('.offcanvas-email-form').modal();
                    return false; 
                }
                catch(ex){
                    alert(ex);
                    return false;
                }
                
            }           
        });
    }
});