

var EasyStepsClass = function($element){
    var currentTab = 1,
    $el = $element,
    $stepTexts,
    $stepTabs,
    currentStep = 'step1' ;

    return {
        init: function(){
            var that = this;
            $stepTexts = $el.find(".step-text");
            $stepTabs = $el.find(".service-right-tab");

            this.showSelectedStepText(currentStep);
            this.showSelectedStepTab();

        },

        showSelectedStepText: function(){

            var selectedStep = currentStep;

            $stepTexts.each(function(index, e){
                if ( $(e).attr('id') ===  selectedStep ){
                    $(e).show();
                }
                else{
                    $(e).hide();
                }
            });
        },

        showSelectedStepTab: function(){
            $stepTabs.each(function(index, e){
                if( $(e).data('step') === currentStep){
                    $(e).addClass("selected")
                }
                else{
                    $(e).removeClass('selected')
                }
            })
        },

        setCurrentStep: function(newCurrentStep){
            currentStep = newCurrentStep;
            this.showSelectedStepTab();
            this.showSelectedStepText();
        },

        getCurrentTab: function(){
            return currentTab;
        }
    }
}

$(function(){
    easySteps = new EasyStepsClass( $(".easy-steps") );
    easySteps.init();


    $(".service-right-tab").on("click", function(e){
        easySteps.setCurrentStep($(e.currentTarget).data('step'));
    });
});


//1.  find all the .step-texts
//2.  match the one with data/id
//3.  hide all the others