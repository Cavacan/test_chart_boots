class StepRecordsController < ApplicationController
  def index
    @interval = params[:interval] || "day"

    @step_records = current_user.step_records.order(date: :asc)

    @chart_data = 
      case @interval
      when "week"
        @step_records.group_by_week(:date).sum(:steps)
      when "month"
        @step_records.group_by_month(:date).sum(:steps)
      else
        @step_records.group_by_day(:date).sum(:steps)
      end
  end
end
