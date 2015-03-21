class MedicinesController < ApplicationController
	before_action :set_medicine, only: [:edit, :update, :show, :destroy]

	def index
		@current_user = current_user
		@medicines = Medicine.where(user_id: current_user.id)
	end
  
	def new
  		@medicine = Medicine.new
  	end

    def show
    end

    def update
    	@medicine.update(params[:medicine])
    	redirect_to @medicine, flash[:notice] = "You have updated your medicine."
  	end


  # SendEmailJob.set(wait: 3.seconds).perform_later(@medicine)
	def create  		
  		@medicine.user_id = current_user.id
  		if @medicine.save
  			flash[:notice] = "You have entered your medicines"
  			redirect_to medicines_path
  		else
  			render :back, flash[:notice] = "Please enter your medicines"
  		end
	end	

	def destroy
		@medicine.destroy
		redirect_to profile_path
	end
	
	private
	
	def med_params
	 params.require(:medicine).permit(:name, :user_id, :reminder_time, :dosage)
	end

	def set_medicine
    	@medicine = Medicine.find(params[:id])
    end
end




# def destroy
#     @user = User.find(params[:id])
#     if @user.destroy
#       flash[:notice] = "User deleted successfully."
#     else
#       flash[:alert] = "There was a problem deleting the user."
#     end
#     redirect_to users_path
#   end














