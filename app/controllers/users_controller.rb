class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users/1/edit
  def edit
  end

  def show
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts params[:id]
      @user = User.find(params[:id])
      puts @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
       params.require(:user).permit(:first_name, :last_name, :email, :company_name)
    end

end
