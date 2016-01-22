class ProductsController < ApplicationController


    def index
        # Find all products
        @products = Product.all
    end

    def show
        # Show selected product
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(white_listed_params)
        
        if @product.save
            flash[:success] = "Product Added"
            # Return to products index file
            redirect_to products_path
		else
			render "new"
		end
        
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        
        @product = Product.find(params[:id])
		
        if @product.update(white_listed_params)
            flash[:success] = "Details Updated"
            redirect_to products_path
        else
            render "edit"
        end
    end

    def destroy
        
        @product = Product.find(params[:id])
		
        @product.destroy
		
        flash[:success] = "Product Deleted"

		redirect_to root_path
    end

    def white_listed_params
        # Permitted criteria	
        params.require(:product).permit(:range_name, :product_name, :price_now, :description)
    end


end
