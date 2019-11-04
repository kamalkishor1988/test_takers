# User controller to process input logic
class UsersController < ApplicationController
  require 'csv'
  def index
  end

  def import
    file = params[:file]
    return redirect_to root_path, notice: 'Please select input Data File(CSV or JSON)' if file.blank?
    @data = if file.content_type == 'text/csv'
              data = []
              CSV.foreach(file.path, headers: true) do |row|
                data << row.to_hash
              end
              data
            else
              JSON.parse(file.read)
            end
  end
end
