class ListsController < ApplicationController
    before_action :set_list, only: [:update, :destroy, :show]
    def create
        @list = List.create(list_params)
        if @list.valid?
            render json: {
                list: @list
            }
        end
    end

    def update
        @list.update(list_params)
        if @list.valid?
            render json: {
                list: @list
            }
        else
            render json: {
                status: 500,
                errors: "Could not update list"
            }
        end
    end

    def destroy
        if @list.user == current_user
            @list.destroy
            render json: {
                list: @list, 
                message: "Successfully deleted."
            }
        else
            render json: {
                status: 500, 
                errors: "You are not authorized to delete this list"
            }

    end

    def show
        if @list
            render json: {
                list: @list
            }
        else
            render json: {
                status: 500, 
                errors: "List not found"
            }
        end
    end

    def index
        @board = Board.find_by(id: params[:board_id])
        if @board
            render json: {
                lists: @board.lists
            }
        else
            render json: {
                errors: "Board not found"
            }
        end

    end

    private
    def list_params
        params.require(:list).permit(:name, :content, :board_id)
    end

    def set_list
        @list = List.find_by(id: params[:id])
    end
end
