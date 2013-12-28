module ToutsHelper
  ##
  # Show block only for user with admin role
  def only_for_owner(toute, &block)
    yield block if user_signed_in? && (current_user.admin? || current_user.id == toute.user_id)
  end

end
