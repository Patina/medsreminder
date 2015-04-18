class CardsController < ApplicationController
	def index
		@cards = Card.all
	end

		def create
			@card = Card.create(title: "Medication Reminder Notecard", body: "Medication Reminder")
			respond_to do |format|
				format.html {redirect_to root_path, notice: "New card created"}
				format.js #to respond to javascript
			end
		end

		def destroy
			@card = Card.find(params[:id])
			@card.destroy
			respond_to do |format|
				format.html {redirect_to root_path, notice: "Card was deleted"}
				format.js { head :no_content } #for missing destroy template
		end
	end
end
