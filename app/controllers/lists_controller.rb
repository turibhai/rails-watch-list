class ListsController < ApplicationController
  def index
    
    @lists = List.all
    @list = List.new
    
  end

  def show
    
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'index', status: :unprocessable_entity
    end
    
  # def destroy
  #   @list = List.find(params[:id])
  #   @list.destroy
  #    redirect_to list_path, status: :see_other

  # end
  end


  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
