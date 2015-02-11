class ListController < ApplicationController
	def index
		@lists =  List.all
		@lid = params[:lid]
		# @pid = params[:pid]
		#@lid = 6
	end
	def new_partial
		@lid_new_partial = params[:lid]
	end
	def new
	    @list = List.new
	    @current_list = params[:list]
	    
	end
	def create
		# @pid = params[:pid]
		#@list = List.new(:name => params[:name],:pid => @pid)
	    @list = List.new(list_params)
		if @list.save
			redirect_to root_url 
      	else
	    	render 'new'
	    end
	end

 	private
		def list_params
	    		params.require(:list).permit(:name,:pid)
	    		# => params[:pid])
	    end


end
