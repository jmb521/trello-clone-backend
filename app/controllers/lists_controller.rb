class ListsController < ApplicationController

    def create
        @list = List.create(list_params)
        if @list.valid?
            render json: {
                list: @list
            }
        end
    end

    def update

    end

    def destroy

    end

    private
    def list_params
        params.require(:list).permit(:name, :content, :board_id)
    end
end
