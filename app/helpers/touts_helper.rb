module ToutsHelper
  ##
  # Show block only for user with admin role
  def only_for_owner(toute, &block)
    yield block if user_signed_in? && (current_user.admin? || current_user.id == toute.user_id)
  end

  def last_touts(city, operation, limit)
    operation = Operation.where(alias: operation).first
    touts     = Tout.ordered.where(city: city).where(operation: operation).limit(limit)
    out       = %Q{<h4>#{link_to operation.name, touts_path(city: city.alias, operation: operation.alias)}</h4>}
    touts.each do |tout|
      out << %Q{
<div class="tout">
  <div class="clearfix">
    #{image_tag tout.photos.first.image.thumb.url, class: 'photos-dashboard' unless tout.photos.first.nil?}
    #{link_to tout.name, tout}
  </div>
  <div class="toute-sub-tags">
    #{tout_tags(tout, {not_operation: true, not_city: true})}
  </div>
</div>
      }
    end
    out.html_safe
  end

  def tout_tags(tout, opt={})
    out = ''
    out << %Q{<span class="label label-primary">#{link_to tout.operation.name, touts_path(operation: tout.operation.alias, city: params[:city], category: params[:category])}</span>} unless opt[:not_operation]
    out << %Q{<span class="label label-success">#{link_to tout.category.name, touts_path(operation: params[:operation], city: params[:city], category: tout.category.alias)}</span>} unless opt[:not_category]
    out << %Q{<span class="label label-info">#{link_to tout.city.name, touts_path(operation: params[:operation], city: tout.city.alias, category: params[:category])}</span>} unless opt[:not_city]
    out << %Q{<span class="label label-warning">#{tout.user.first_name}</span>} unless opt[:not_user]
    out.html_safe
  end

end
