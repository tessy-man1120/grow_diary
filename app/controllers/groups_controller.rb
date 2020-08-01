class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Success Create Group'
    else
      render :new
    end
  end

  def edit
    if user_signed_in? == @group.users.include?(current_user)
      render "edit"
    else
      redirect_to root_path, alert: 'Warning! Do not enter directly'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Updated Group'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to group_path, notice: "Success group delete"
  end

  def show; end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
