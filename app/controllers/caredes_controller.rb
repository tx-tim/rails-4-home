class CaredesController < ApplicationController

    http_basic_authenticate_with name: "casham", password: "casham" 
    before_action :set_fixtures
    
    def index
        render layout: "caredes"
    end

    def caredes_tcc
        render layout: "caredes"
    end

    def caredes_occ
        render layout: "caredes"
    end

    private
        def set_fixtures
            @services = ["Pawn Loans", "Auto Equity Loan", "Cash Advance", "Preowned Merchandise", "Check Cashing", "Prepaid Debit Cards", "Money Orders", "Insurance", "Gold Purchase", "Money Transfer", "Income Tax" ]
            @brands = ["Cash America", "SuperPawn", "Cashland", "Payday Advance"]
        end
end
