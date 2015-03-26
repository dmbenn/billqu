class CodesController < ApplicationController
  def index
    if current_user
      @codes = policy_scope(Code)
    else
      @codes = Code.where(private: false)
    end
  end

  def show
    @code = Code.find(params[:id])
    authorize @code
  end

  def new
    @code = Code.new
    authorize @code
  end
  
  def create
    @code = Code.new(code_params)
    @user = current_user
    authorize @code
    if @code.save
      @code.users << @user
      redirect_to @code, notice: "Code was added succesfully"
    else
      flash[:error] = "Error creating Code"
      render :new
    end
  end

  def edit
    @code = Code.find(params[:id])
    authorize @code
    @users = @code.users
  end
  
  def update
    @code = Code.find(params[:id])
    authorize @code
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

    authorize @code
    if @code.destroy
      redirect_to codes_path, notice: "\"#{title}\" was deleted successfully"
    else
      flash[:error] = "Could not delete Code"
      render :show
    end
  end
  
  def remove_editor
    @code = Code.find(params[:id])
    @user = User.find(params[:format])
    @code.users.delete(@user)
    redirect_to edit_code_path(@code)
  end
  
  def add_editor
    @code = Code.find(params[:id])
    @user = User.where(email: params[:email])
    
    if @user.empty?
      redirect_to edit_code_path(@code), alert: "User Not Found"
    elsif @code.users.include?(@user)
      redirect_to edit_code_path(@code), alert: "Editor already added"
    else
      @code.users << @user
      redirect_to edit_code_path(@code), notice: "Editor added succesfully"
    end
  end
  
  private
  
  def code_params
    params.require(:code).permit(:title, :body, :private, :user_id)
  end
  
end
