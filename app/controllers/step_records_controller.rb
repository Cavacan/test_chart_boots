class StepRecordsController < ApplicationController
  def index
    @step_records = current_user.step_records.order(date: :asc)
    @step_data = @step_records.group(:date).sum(:steps)
  end
end
