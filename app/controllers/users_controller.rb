class UsersController < ApplicationController
  def index
    render json: {
      users: User.all.includes(:received_points).map do |user|
          {
            id: user.id,
            name: user.name,
            email: user.email,
            phone: user.phone,
            points: user.map_points
          }
        end
      }
  end
end
