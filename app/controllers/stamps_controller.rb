class StampsController < ApplicationController
  def create
    stamp = Stamp.new(kind: params[:kind], user_id: current_user.id, report_id: params[:report_id])
    stamp.save

    respond_to do |format|
      format.html { render text: "hello" }
      format.json
    end
  end

end
