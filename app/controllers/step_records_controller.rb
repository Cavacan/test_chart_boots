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

  def new
    @step_record = StepRecord.new(user_id: current_user.id, date: Time.zone.today)
  end

  def create
    @step_record = StepRecord.new(step_params.merge(user_id: current_user.id))
    if @step_record.save
      redirect_to step_records_path, notice: 'データを記録しました。'
    else
      render :new
    end
  end

  def edit
    @new_step_record = StepRecord.new(user_id: current_user.id)
    @step_records = current_user.step_records.order(date: :asc)
  end

  def update
    @step_record = current_user.step_records.find(params[:id])
    if @step_record.update(step_params)
      redirect_to step_records_path, notice: '更新しました'
    else
      redirect_to edit_step_records_path, alert: '更新に失敗しました'
    end
  end      


  private

  def step_params
    params.require(:step_record).permit(:date, :steps, :user_id)
  end
end
