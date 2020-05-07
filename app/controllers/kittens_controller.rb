class KittensController < ApplicationController
  before_action :get_kitten, only: %i[show edit update]
  before_action :get_kitten_columns
  
  def index
    @kittens = Kitten.all
  end

  def show
    respond_to do |format|
      format.html
    end 
  end

  def new
   @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    # if the save doesn't validate we render the form through 'new'
    if @kitten.save
      redirect_to @kitten
    else
      render 'new'
    end
  end
    


  private

    def get_kitten
      @kitten = Kitten.find(params[:id])
    end

    # This is maybe not the best implementation
    def get_kitten_columns
      kitten_keys = [:name, :age, :cuteness, :softness]
      @kitten_columns = kitten_keys
    end

    # these are the fields we can edit
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end