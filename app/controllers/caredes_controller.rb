class CaredesController < ApplicationController
    before_action :set_fixtures
    
    def index
        render layout: "caredes_tcc"
    end

    def caredes_tcc
        render layout: "caredes_tcc"
    end

    private
        def set_fixtures
            @services = ["Pawn Loans", "Auto Equity Loan", "Cash Advance", "Preowned Merchandise", "Check Cashing", "Prepaid Debit Cards", "Money Orders", "Insurance", "Gold Purchase", "Money Transfer", "Income Tax" ]
            @brands = ["Cash America", "SuperPawn", "Cashland", "Payday Advance"]
        end
end
