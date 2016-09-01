class PointsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'points'
  end

  def delete(data)
    id = data["id"]
    Point.destroy(id)
    ActionCable.server.broadcast 'points', { action: 'delete', id: id }
  end

  def receive(data)
    val, typ, res, rec = data.values_at("value", "type", "reason", "receiver")
  	point = Point.new(
      value: val,
      point_type: Point.point_types[typ],
      reason: res,
      giver_id: 2,
      receiver_id: rec
    )
    if point.save
  	  ActionCable.server.broadcast 'points', { point: point.to_json }
  	end
  end
end
