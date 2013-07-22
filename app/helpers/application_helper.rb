module ApplicationHelper
  def user_controls
    if user_signed_in?
      return raw %Q{
        <div class="user">
          <img src="#{current_user.photo}" alt="#{current_user.first_name}" class="avatar" />
          <a href="#profile">#{current_user.first_name}</a>
          #{link_to 'exit', session_path(666), :method => :delete}
        </div>
      }
    else
      return raw %Q{
        <script src="http://ulogin.ru/js/ulogin.js" type="text/javascript" async="async"></script>
        <div id="uLogin" data-ulogin="display=panel;fields=email,first_name,phone,photo,photo_big;optional=city,bdate,sex,country;providers=vkontakte,facebook,livejournal,odnoklassniki,twitter,google,yandex;hidden=other;redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fsessions%2F"></div>
      }
    end

  end
end
