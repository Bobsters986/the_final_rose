class ContestantOutingsController < ApplicationController
  def destroy
    contestant = Contestant.find(params[:contestant_id])
    outing = Outing.find(params[:id])
    contestant_outing = ContestantOuting.find_by(contestant_id: contestant.id, outing_id: outing.id)
    contestant_outing.destroy
    
    redirect_to outing_path(outing)
  end
end