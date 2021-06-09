class ClientsController < ApplicationController

    def index
        clients = Client.all 
        render json: clients, except: [:created_at, :updated_at]
    end

    def show
        client = Client.find(params[:id])
        render json: client

    end

    def create
        client = Client.create!(client_params)
        render json: client 
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
    end

    def destroy
        client = Client.find(params[:id])
        client.destroy
    end


    private 

    def client_params
        params.require(:client).permit(:name, :email, :username, :location, :avatar, :password)
    end
end
