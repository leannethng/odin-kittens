class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kittens = Kitten.find(params[:id])
  end

end
