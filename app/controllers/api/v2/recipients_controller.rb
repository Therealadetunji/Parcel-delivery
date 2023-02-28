class Api::V2::RecipientsController < ApplicationController
    def index
        @recipients = Recipient.all
        render json: @recipients
    end

    def create
        @recipient = Recipient.new(recipient_params)
        if @recipient.exists?
            render json: {message: "Recipient already exists"}
        elsif @recipient.save
            render json: @recipient, status: :created
        else
            render json: @recipient.errors, status: :unprocessable_entity
        end
           
    end

    def show
        @recipient = Recipient.find(params[:id])
        render json: @recipient
    end

    def destroy
        @recipient = Recipient.find(params[:id])
        if @recipient.destroy
            render json: {message: "Recipient deleted"}
        else
            render json: {message: "Recipient not deleted"}
        end
    end

    private

    def recipient_params
        params.require(:recipient).permit(:name)
    end
end
