class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    # two part confirmation if unapproved its just to confirm email if approved then it is to set password
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      @approved = resource.approved
     
    if @approved == false
      yield resource if block_given?

      if resource.errors.empty?
        set_flash_message(:notice, :confirmed) if is_flashing_format?
        redirect_to confirmed_path
      else
        respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
      end
    else
      yield resource if block_given?

      if resource.errors.empty?
        set_flash_message(:notice, :confirmed) if is_flashing_format?
        respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      else
        respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
      end
    end    
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
