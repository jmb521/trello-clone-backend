class BoardsController < ApplicationController
    before_action :set_board, only: [:show, :update, :destroy]
    def index
        @boards = Board.all
        if @boards
            render json: {
                boards: @boards
            }
        else
            render json: {
                errors: "You are not currently signed in"
            }
        end
    end

    def show
        if @board
            render json: {
                board: @board
            }
        else 
            render json: {
                errors: "Board not found."
            }
        end
    end
    
    def create
        
        @board = Board.create(board_params)
        if @board.valid?
            render json: {
                board: @board
            }
        else
            render json: {
                status: 500, 
                errors: @board.errors
            }
        end
    end

    def update
        if @board
            @board.update
            render json: {
                board: @board
            }
        else
            render json: {
                status: 500, 
                errors: @board.errors
            }
        end
    end

    def destroy
        if @board
            @board.destroy
            render json: {
                board: @board
            }
        else
            render json: {
                errors: "Board not found"
            }
        end
    end

    private

    def board_params
        params.require(:board).permit(:name, :user_id)
    end

    def set_board
        @board = current_user.boards.find_by(id: params[:id])
    end

  
end
