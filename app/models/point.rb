class Point < ApplicationRecord
  enum point_type: { brosty: 0, regular: 1, badge: 2 }

  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  belongs_to :giver, class_name: "User", foreign_key: "giver_id"
end
