class AutocompleteController < ActionController::Base
  before_action :force_json, only: :search

  def search
    q = params[:q].downcase
    @drivers = User.where("name ILIKE ? or family_name ILIKE ?", "%#{q}%", "%#{q}%").limit(5)
  end

  private
  def force_json
    request.format = :json
  end
end
