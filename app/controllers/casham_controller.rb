class CashamController < ApplicationController
  
    http_basic_authenticate_with name: "casham", password: "casham" 
    before_action :set_fixtures

    def index
        render layout: "casham_layout"
    end

    def template_occ
        render layout: "casham_occ"
    end

    def template_tcc
        render layout: "casham_tcc"
    end

    def store_search_page
        render layout: "casham_occ"
    end

    private
        def set_fixtures
            @services = ["Pawn Loans", "Auto Equity Loan", "Cash Advance", "Preowned Merchandise", "Check Cashing", "Prepaid Debit Cards", "Money Orders", "Insurance", "Gold Purchase", "Money Transfer", "Income Tax" ]
            @brands = ["Cash America", "SuperPawn", "Cashland", "Payday Advance"]
        end

end
