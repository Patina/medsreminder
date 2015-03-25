class MedicinesController < ApplicationController
	before_action :set_medicine, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	
	def index
		@current_user = current_user
		@medicines = Medicine.where(user_id: current_user.id)
	end
  
	def new
  		@medicine = Medicine.new
  	end

  	def edit
  	end
  	
    def show
    end

    def update
    	@medicine.update(params[:medicine])
    	redirect_to @medicine, flash[:notice] = "You have updated your medicine."
  	end


  # SendEmailJob.set(wait: 3.seconds).perform_later(@medicine)
	def create  		
  		@medicine = Medicine.new(med_params)
  		@medicine.user_id = current_user.id

  		if @medicine.save
  			flash[:notice] = "You have entered your medicines"
  			if params[:medicine][:source] == "profile"
          redirect_to profile_path #profile_path
        else
          redirect_to new_medicine_path
        end
  		else
        flash[:notice] = "Please enter your medicines"
  			render :new
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
















