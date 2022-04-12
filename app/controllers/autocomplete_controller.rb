class AutocompleteController < ActionController::Base
  before_action :force_json, only: :search

  def search
    q = params[:q].downcase
    @drivers = User.where("id <> ? and (name ILIKE ? or family_name ILIKE ?)", "#{current_user.id}", "%#{q}%", "%#{q}%").limit(5)

  end

  private
  def force_json
    request.format = :json
  end
end
