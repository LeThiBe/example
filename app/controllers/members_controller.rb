class MembersController < ApplicationController
  before_action :load_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @posts = @member.posts.build
    @avatar = @member.build_avatar
  end

  def create
    @member = Member.new member_params
    if @member.save
      flash[:success] = "Create member successfull"
    else
      flash[:danger] = "Create member fail"
    end
    redirect_to members_path
  end

  def edit; end

  def update
    if @member.update_attributes member_params
      flash[:success] = "update successfull"
    else
      flash[:danger] = t "update fail"
    end
    redirect_to members_path
  end

  private

  def load_member
    @member = Member.find_by id: params[:id]
    return if @member
    flash[:danger] = "Not found"
    redirect_to members_path
  end

  def member_params
    params.require(:member).permit :name, posts_attributes: [:id, :title], avatar_attributes: [ :icon]
  end
end
