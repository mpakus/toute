class Touts::CommentsController < ApplicationController
  before_action :set_tout, only: [:create, :destroy]

  ##
  # Leave new comment
  ##
  def create
    @comment = @tout.comments.create!(content: params[:comment][:content], user: current_user)
    redirect_to tout_path(@tout)+"#comment#{@comment.id}", notice: t('comments.created')
  rescue => e
    redirect_to tout_path(@tout), alert: e.message
  end

  ##
  # Delete comment
  ##
  def destroy
    if @tout.user == current_user
      @tout.comments.destroy(params[:id])
      respond_to do |format|
        format.html { redirect_to tout_path(@tout)+"#comments", notice: t('comments.destroyed') }
        format.js   { render js: 'console.log("done")' }
      end
    else
      respond_to do |format|
        format.html { redirect_to tout_path(@tout)+"#comments", alert: t('comments.access_denied') }
        format.js   { render js: 'console.log("access denied")' }
      end
    end
  end

  private
  def set_tout
    if !user_signed_in?
      redirect_to root_path, alert: t('errors.sign_in_first')
      return false
    end
    @tout = Tout.find(params[:tout_id])
  end
end