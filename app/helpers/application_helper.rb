module ApplicationHelper

  ###
  #
  def user_controls
    if user_signed_in?
      return raw %Q{
        <ul class="nav navbar-nav toute-user">
          <li><img src="#{current_user.photo}" alt="#{current_user.first_name}" class="avatar" /></li>
          <li><a href="#my-toutes">#{current_user.first_name}</a></li>
          <li>#{link_to t('buttons.logout'), session_path(666), :method => :delete}</li>
        </ul>
      }
    else
      return raw %Q{
        <ul class="nav navbar-nav">
          <li class="navbar-form">
            <button class="btn btn-primary" data-toggle="modal" data-target="#login_modal">
              #{I18n.t('menu.authorize')}
            </button>
          </li>
        </div>
      }
    end
  end

  ###
  #
  def form_errors(form, show_field=true)
    html = ''
    if form.errors.any?
      plural = Russian::pluralize(form.errors.count, 'ошибка', 'ошибки', 'ошибок')
      html = "
        <div class=\"alert alert-error\">
          <a class=\"close\" data-dismiss=\"alert\">&#215;</a>
          <div>У вас #{form.errors.count} #{plural}:</div>
          <ul>"
      form.errors.each do |field, msg|
        html += (show_field) ? "<li>#{field} #{msg}</li>" : "<li>#{msg}</li>"
      end
      html += "
        </ul>
      </div>"
    end
    return raw(html)
  end

end
