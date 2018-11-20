class SubsController < ApplicationController
  before_action :require_login
  before_action :require_moderator, only: [:update, :destroy, :edit]
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find(params[:id])
    
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  def index
    @subs = Sub.all
    render :index
  end
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
  def require_moderator
    @sub = current_user.subs.find_by(id: params[:id])
    redirect_to new_session_url unless @sub
  end
end
