class PointsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'points'
  end

  def receive(data)
  	@point = Point.new(
      value: data["value"],
      point_type: Point.point_types[data["type"]],
      reason: data["reason"],
      giver_id: 2,
      receiver_id: data["receiver"]
    )

    if @point.save
  	  ActionCable.server.broadcast 'points', { point: @point.to_json }
  	end
  end
end