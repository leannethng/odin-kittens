class KittensController < ApplicationController
  before_action :get_kitten, only: %i[show edit update]
  before_action :get_kitten_columns
  
  def index
    @kittens = Kitten.all
  end

  def show
    # because we are passing in the @kitten in the before action from the private params, we only have to say what format we want the response in here
  
    respond_to do |format|
      format.html
    end
  end

  def new
   @kitten = Kitten.new
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def create
    @kitten = Kitten.new(kitten_params)
    # if the save doesn't validate we render the form through 'new'
    if @kitten.save
      flash[:success] = "You have created #{@kitten.name}."
      redirect_to @kitten
    else
      flash.now[:error] = "You didn't add a new kitten."
      render 'new'
    end  
  end

  def update
    @kitten = Kitten.find(params[:id])
    # Redirect back to the show kitten
    if @kitten.update(kitten_params)
      flash[:success] = "You have updated #{@kitten.name}."
      redirect_to @kitten
    else
      flash.now[:error] = "You have not updated #{@kitten.name}."
      render 'edit'
    end
  end
   
  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "You have deleted #{@kitten.name}."
    # redirecting back to the index
    respond_to do |format|
      format.html { redirect_to kittens_path }
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