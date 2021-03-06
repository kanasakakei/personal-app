class GroupsController < ApplicationController


def index
  @groups = Group.all
end


def new
  @group = Group.new
  
end

def edit
  @group = Group.find(params[:id])
end

def create
  @group = Group.new(group_params)
  if @group.save
    redirect_to root_path, notice: 'カテゴリが作成されました'
  else
    render :new
  end
end

private

def group_params
  params.require(:group).permit(:name)
  
end

end
