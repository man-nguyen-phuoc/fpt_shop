module Users
  class UpdateCurrentUserService
    def initialize(current_user, user_params)
      @user_params = user_params
      @current_user = current_user
    end

    def call
      @current_user.update(@user_params)
    end
  end
end