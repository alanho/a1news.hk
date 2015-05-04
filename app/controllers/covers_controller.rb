class CoversController < ApplicationController
  def index
    if params[:date] =~ /[0-9]{4}-[0-9]{2}-[0-9]{2}/
      @date = Date.parse(params[:date]) rescue nil
    else
      @date = 6.hours.ago.to_date # we change to a new date on 6am  
    end
    raise ActiveRecord::RecordNotFound unless @date

    @covers = Cover.where(:date => @date).all
  end

  def show
    raise ActiveRecord::RecordNotFound unless Cover::NEWS_NAMES.has_key?(params[:id])
    
    respond_to do |format|
      format.html {
        @covers = Cover.where(:source => params[:id]).order("date DESC").page(params[:page]).per(12)

        if request.xhr?
          render :partial => "covers", :layout => false
        else
          render
        end
      }
      format.json {
        @covers = Cover.where(:source => params[:id]).order("date DESC").page(params[:page]).per(100)
        render
      }
    end
  end
end
