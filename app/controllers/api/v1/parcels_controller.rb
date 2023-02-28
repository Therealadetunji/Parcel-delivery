class Api::V1::ParcelsController < ApplicationController
    def index 
        @parcels = Parcel.all
        render json: @parcels
    end

    def create
        @parcel = Parcel.new(parcel_params)
        if @parcel.save
            render json: @parcel, status: :created
        else
            render json: @parcel.errors, status: :unprocessable_entity
        end
    end

    def show
        @parcel = Parcel.find(params[:id])
        render json: @parcel
    end

    def destroy
        @parcel = Parcel.find(params[:id])
        if @parcel.destroy
            render json: {message: "Parcel deleted"}
        else
            render json: {message: "Parcel not deleted"}
        end
    end

    private

    def parcel_params
        params.require(:parcel).permit(:recipient_id, :name)
    end

end
