$(function(){

    if( $('.search-criteria-wrapper').length  ){
        //console.log('bs-select');
        //STEP 2:
            $('li.option').click(function(event){
                var miles = $(event.currentTarget).data('value');
                
        //notice here you must fire the change event manually after settting the value
                $('.miles-select').val(miles).change();
            })

        //STEP 3
            $('.miles-select').change(function(){
                //alert('changed event fired')
            });
    }

})