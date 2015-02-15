class CodesController < ApplicationController
  def index
    @codes = Code.all
  end

  def show
    @code = Code.find(params[:id])
  end

  def new
    @code = Code.new
  end
  
  def create
    @code = Code.new(code_params)
    # I know this is coming later authorize @code
    if @code.save
      redirect_to @code, notice: "Code was added succesfully"
    else
      flash[:error] = "Error creating Code"
      render :new
    end
  end

  def edit
    @code = Code.find(params[:id])
  end
  
  def update
    @code = Code.find(params[:id])
    # authorize @code
    if @code.update_attributes(code_params)
      redirect_to @code
    else
      flash[:error] = "Error saving Code. Please try again"
      render :edit
    end
  end
  
  def destroy
    @code = Code.find(params[:id])
    title = @code.title

    # Will need this later authorize @code
    if @code.destroy
      redirect_to codes_path, notice: "\"#{title}\" was deleted successfully"
    else
      flash[:error] = "Could not delete Code"
      render :show
    end
  end
  
  private
  
  def code_params
    params.require(:code).permit(:title, :body, :private)
  end
  
end
