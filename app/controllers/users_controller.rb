class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
      end
      
      #in your view
    #   <%= @user.name %>
      
      #routes.rb
    #   match 'users/:id' => 'users#show', via: :get

    
end
