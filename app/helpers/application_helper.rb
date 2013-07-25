module ApplicationHelper

  ###
  #
  def user_controls
    if user_signed_in?
      return raw %Q{
        <ul class="nav pull-right user">
          <li><img src="#{current_user.photo}" alt="#{current_user.first_name}" class="avatar" /></li>
          <li><a href="#my-toutes">#{current_user.first_name}</a></li>
          <li>#{link_to t('buttons.logout'), session_path(666), :method => :delete}</li>
        </ul>
      }
    else
      return raw %Q{
        <script src="http://ulogin.ru/js/ulogin.js" type="text/javascript" async="async"></script>
        <div id="uLogin" data-ulogin="display=panel;fields=email,first_name,phone,photo,photo_big;optional=city,bdate,sex,country;providers=vkontakte,facebook,livejournal,odnoklassniki,twitter,google,yandex;hidden=other;redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fsessions%2F"></div>
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
          <div>#{form.errors.count} #{plural} в форме:</div>
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
