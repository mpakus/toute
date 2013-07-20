class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    require 'open-uri'
    token = params[:token]

    json = open("http://ulogin.ru/token.php?token=#{token}&host=#{request.host}").read
    unless json.blank?
      ulogin = JSON.parse(json)
      p ulogin
      # todo: check about Token Expired
      # {"error"=>"token expired"}

      # todo: create or get user from db
      user = User.find_by_email(ulogin['email'])
      unless user
        #create
        # Facebook data
        # {"verified_email"=>"1", "uid"=>"111111051175529", "phone"=>"+6(687)085-1776", "network"=>"facebook", "profile"=>"https://www.facebook.com/mpakus", "manual"=>"phone", "email"=>"mrak69@gmail.com", "first_name"=>"Renat", "identity"=>"https://www.facebook.com/mpakus", "photo_big"=>"http://graph.facebook.com/100001051175529/picture?type=large", "photo"=>"http://graph.facebook.com/100001051175529/picture?type=square"}
        # Twitter
        # {"verified_email"=>"-1", "uid"=>"19964603", "phone"=>"+6(687)085-1776", "network"=>"twitter", "profile"=>"http://twitter.com/mpak999", "manual"=>"email,phone", "email"=>"mrak69@gmail.com", "first_name"=>"MpaK", "city"=>"Koh Samui, Thailand", "identity"=>"http://twitter.com/mpak999", "photo_big"=>"http://a0.twimg.com/profile_images/1133092438/27426_100001051175529_2394_q_normal.jpg", "photo"=>"http://a0.twimg.com/profile_images/1133092438/27426_100001051175529_2394_q_normal.jpg"}
        # VK
        # {"verified_email"=>"-1", "uid"=>"3338343", "phone"=>"+6(687)085-1776", "network"=>"vkontakte", "profile"=>"http://vk.com/id2228343", "manual"=>"email,phone", "email"=>"mpak666@inbox.ru", "first_name"=>"Ренат", "city"=>"Surat Thani", "identity"=>"http://vk.com/id2228343", "photo_big"=>"http://cs417018.vk.me/v417018343/5979/AXnM3m0Xo2c.jpg", "photo"=>"http://cs417018.vk.me/v417018343/597d/cGpeMkpZes4.jpg"}
        #ulogin = {
        #    'email'
        #}
        #user = User.create(ulogin)
      end
    end

    #session[:user_id] = user.id
    #redirect root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end

end
