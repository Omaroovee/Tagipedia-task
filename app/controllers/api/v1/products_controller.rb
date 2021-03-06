module Api
  module V1
    class ProductsController < ApplicationController
      def index

        # Store all query strings 
        url = request.query_parameters
        name = url['name']

        # search product by it's name 
        product =  Product.where(product_name: name)

        # if the item found
        if product[0] != nil 
          render json: {status: 'SUCCESS', message:'Product Found', data:product},status: :ok
        else
          # if the item not found
          render json: {status: 'FAILED', message:'Product Not Found'},status: :not_found
        end
      end
    end
  end
end