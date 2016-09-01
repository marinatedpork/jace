class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :given_points, :foreign_key => "giver_id", :class_name => "Point"
  has_many :received_points, :foreign_key => "receiver_id", :class_name => "Point"

  def map_points
    self.received_points.map do |point| 
      {
        id: point.id,
        giver: point.giver_id,
        receiver: point.receiver_id,
        value: point.value,
        type: point.point_type,
        reason: point.reason
      }
    end
  end

end
