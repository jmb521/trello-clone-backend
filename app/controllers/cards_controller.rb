class CardsController < ApplicationController
    before_action :set_card, only: [:update, :destroy]
    def index
        

    end
    def create
        @card = Card.create(card_params)
        if @card.valid?
            render json: {
                card: @card
            }
        else
            render json: {
                errors: @card.errors
            }
        end
    end

    def update
        @card.update(card_params)
        if @card.valid?
            render json: {
                card: @card
            }
        else
            render json: {
                errors: @card.errors
            }
        end

    end

    def destroy
        #do we want to use this or just remove from view?

    end

    private
    def card_params
        params.require(:card).permit(:title, :content, :due_date, :list_id)
    end

    def set_card
        @card = Card.find_by(id: params[:id])
    end
end
