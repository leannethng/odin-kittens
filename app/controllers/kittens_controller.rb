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

  private

    def get_kitten
      @kitten = Kitten.find(params[:id])
    end  

    def get_kitten_columns
      kitten_keys = [:name, :age, :cuteness, :softness]
      @kitten_columns = kitten_keys
    end
end