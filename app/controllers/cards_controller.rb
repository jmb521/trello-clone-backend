class CardsController < ApplicationController
    before_action :set_card, only: [:update, :destroy, :show]
    
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
        

    end

    def show
        if @card
            render json: {
                card: @card
            }
        else
            render json: {
                errors: "Card not found"
            }
        end
    end

    def index
        if params[:list_id]
            @list = List.find_by(id: params[:list_id])
            if @list
                render json: {
                    cards: @list.cards
                }
            else
                render json: {
                    errors: "List not found"
                }
            end
        end
    end

    private
    def card_params
        params.require(:card).permit(:title, :content, :due_date, :list_id)
    end

    def set_card
        @card = Card.find_by(id: params[:id])
    end
end
