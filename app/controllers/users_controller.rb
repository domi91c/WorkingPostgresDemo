class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]



	def show_user
		@user = current_user
				render 'show'
  end

	def index
		@user = User.all
	end

	def new
		@user = User.new
		render profiles_path

	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to posts_path, notice: 'User successfully added.'

		else
			render profiles_path

		end
	end
	def edit
	end
	def update
		if @user.update(user_params)
			redirect_to posts_path, notice: 'Updated user information successfully.'
		else
			render action: 'edit'
		end
	end
	private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:signin, :name, :first_name, :last_name, :email).merge(user_id: current_user.id)

	end
end