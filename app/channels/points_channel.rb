class PointsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'points'
  end

  def delete(data)
    id = data['id']
    point = Point.find(id)
    if point.giver == current_user
      point.destroy
      ActionCable.server.broadcast 'points', { action: 'delete', id: id }
    end
  end

  def receive(data)
    attrs = ['value', 'type', 'reason', 'receiver', 'giver']
    val, typ, res, rec, giv = data.values_at(*attrs)
    point = Point.new(
      value: val,
      point_type: Point.point_types[typ],
      reason: res,
      giver_id: giv,
      receiver_id: rec
    )
    if point.save
      ActionCable.server.broadcast 'points', { point: point.to_json }
    end
  end
end
