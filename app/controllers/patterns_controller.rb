class PatternsController < ApplicationController
  respond_to :html
  
  def new
    @pattern = Pattern.new
    @patterns = Pattern.all.order("id DESC").limit(20)
  end
  
  def create
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      Brain.process_pattern(@pattern)
      redirect_to action: :new
    else
      flash[:error] = "unable to store pattern".colorize(:red)
      render :new
    end
  end
  
  private
  
  def pattern_params
    params.require(:pattern).permit(:body)
  end
end
