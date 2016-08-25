class PointsController < ApplicationController
  def create
    point = Point.new(
      value: permit_params[:value],
      point_type: Point.point_types[permit_params[:type]],
      reason: permit_params[:reason],
      giver_id: 2,
      receiver_id: permit_params[:receiver]
    )

    point.save

    render json: { point: point.to_json }
  end

  private

  def permit_params
    params.require(:point).permit(:value, :type, :reason, :giver, :receiver)
  end
end
