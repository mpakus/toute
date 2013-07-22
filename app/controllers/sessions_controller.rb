require 'open-uri'

class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    token = params[:token]

    json = open("http://ulogin.ru/token.php?token=#{token}&host=#{request.host}").read
    unless json.blank?
      ulogin = JSON.parse(json).with_indifferent_access

      redirect_to root_path, notice: t('sessions.error.token_expired') if !ulogin[:error].nil? && ulogin[:error] = 'token expired'
      redirect_to root_path, notice: t('sessions.error.empty_email') if ulogin[:email].nil? || ulogin[:email].blank?

      user = User.find_by_email(ulogin['email'])
      unless user
        # Facebook data
        # {"verified_email"=>"1", "uid"=>"111111051175529", "phone"=>"+6(687)085-1776", "network"=>"facebook", "profile"=>"https://www.facebook.com/mpakus", "manual"=>"phone", "email"=>"mrak69@gmail.com", "first_name"=>"Renat", "identity"=>"https://www.facebook.com/mpakus", "photo_big"=>"http://graph.facebook.com/100001051175529/picture?type=large", "photo"=>"http://graph.facebook.com/100001051175529/picture?type=square"}
        # Twitter
        # {"verified_email"=>"-1", "uid"=>"19964603", "phone"=>"+6(687)085-1776", "network"=>"twitter", "profile"=>"http://twitter.com/mpak999", "manual"=>"email,phone", "email"=>"mrak69@gmail.com", "first_name"=>"MpaK", "city"=>"Koh Samui, Thailand", "identity"=>"http://twitter.com/mpak999", "photo_big"=>"http://a0.twimg.com/profile_images/1133092438/27426_100001051175529_2394_q_normal.jpg", "photo"=>"http://a0.twimg.com/profile_images/1133092438/27426_100001051175529_2394_q_normal.jpg"}
        # VK
        # {"verified_email"=>"-1", "uid"=>"3338343", "phone"=>"+6(687)085-1776", "network"=>"vkontakte", "profile"=>"http://vk.com/id2228343", "manual"=>"email,phone", "email"=>"mpak666@inbox.ru", "first_name"=>"Ренат", "city"=>"Surat Thani", "identity"=>"http://vk.com/id2228343", "photo_big"=>"http://cs417018.vk.me/v417018343/5979/AXnM3m0Xo2c.jpg", "photo"=>"http://cs417018.vk.me/v417018343/597d/cGpeMkpZes4.jpg"}
        user = User.new({
          email: ulogin[:email], phone: ulogin[:phone], first_name: ulogin[:first_name], network: ulogin[:network],
          uid: ulogin[:uid], profile: ulogin[:profile], photo: ulogin[:photo], photo_big: ulogin[:photo_big], city: ulogin[:city],
          sex: ulogin[:sex], birthdate_on: ulogin[:bdate]
        })
        redirect_to root_path, notice: t('sessions.error.user_create_problem') unless user.save
      end
    end
    session[:user_id] = user.id
    redirect_to root_path, notice: t('sessions.message.user_succeful_logined')
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t('sessions.message.user_succeful_logouted')
  end
end
