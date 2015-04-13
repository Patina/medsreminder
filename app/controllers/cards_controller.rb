class CardsController < ApplicationController
	def index
		@cards = Card.all

		def create
			Card.create(title: "??", body: "Something brilliant here...")
			respond_to do |format|
				format.html {redirect_to root_path}
				format.js #to respond to javascript
			end
		end
	end
end
