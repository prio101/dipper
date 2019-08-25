class HomesController < ApplicationController
    before_action :authenticate_user!

    def index
      @projects = Project.where(user_id: current_user.id)
    end
end
