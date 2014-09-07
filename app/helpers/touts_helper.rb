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
    #{tout_tags(tout, {not_operation: true, not_city: true})}
    <p>
      #{link_to tout.name, tout}
    </p>
  </div>
  <div class="toute-sub-tags">

  </div>
</div>
      }
    end
    out.html_safe
  end

  def tout_tags(tout, opt={})
    out = ''
    out << %Q{<span class="operation">#{link_to tout.operation.name, touts_path(operation: tout.operation.alias, city: params[:city], category: params[:category])}</span> } unless opt[:not_operation]
    out << %Q{<strong class="category">#{link_to tout.category.name, touts_path(operation: params[:operation], city: params[:city], category: tout.category.alias)}</strong> } unless opt[:not_category]
    out << %Q{ #{t('from')} <span class="">#{tout.user.name}</span> } unless opt[:not_user]
    out << %Q{<span class="city">г. #{link_to tout.city.name, touts_path(operation: params[:operation], city: tout.city.alias, category: params[:category])}</span> } unless opt[:not_city]
    out.html_safe
  end

end
