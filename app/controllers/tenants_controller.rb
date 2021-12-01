class TenantsController < ApplicationController
  
    
    def index
    tenats=Tenant.all
    render json: tenats, status: :ok

    end

    def create
    tenat=Tenant.create(tenant_params)
    if tenat.valid?
        render json: tenat, status: :created
    else
        render json: {errors: tenat.errors.full_messages},status: :unprocessable_entity
    end
   end

   def update
   tenant=Tenant.find_by(id: params[:id])
   if tenant
    tenant.update(tenant_params)
    if tenant.valid?
        render json: tenant, status: :ok
    else
        render json:{errors: tenant.errors.full_messages}, status: :unprocessable_entity
     end
  else
     render json: {errors: "Not found"}, status: :not_found
end
end

def destroy
    tenant=Tenant.find_by(id: params[:id])
    if tenant
        tenant.destroy
        head :no_content
    else
        render json: {error: "Not found"}, status: :not_found
end
end



    private

    def tenant_params

    params.permit(:name, :age)

    end

end
