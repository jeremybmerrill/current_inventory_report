class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_run_date

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_date
      @run_date = RunDate.all.first.date
    end
end
