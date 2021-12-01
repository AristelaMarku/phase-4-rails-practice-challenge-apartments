class ApartmentsController < ApplicationController


    def create
        apartment=Apartment.create(apartment_params)
        render json: apartment, status: :created
    end

    def index
       apartments=Apartment.all
       render json: apartments, status: :ok
    end

    def update
        apartment=Apartment.find_by(id: params[:id])
        if apartment
            apartment.update(apartment_params)
            render json: apartment, status: :ok

        else
            render json: {errors: "Not found"}, status: :not_found
        end
    end

    def destroy
        apartment=Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else
            render json: {errors: "Not found"}, statud: :not_found
    end
end

    private

    def apartment_params
    params.permit(:number)
    end

end
