class TasksController < ApplicationController
  include DatetimePickerHelper
  
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy,]
  before_action :correct_user, only: [:show, :edit, :update, :destroy,]
  
  def show
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.task_date = strf_picker(params[:task_date])
    if @task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def index
  end
  
  def edit
  end
  

  
  
  
  def update
    if @task.update(task_params)
      flash[:success] = 'メッセージを編集しました。'
      redirect_to @task
    else
      flash.now[:danger] = 'メッセージの編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

  def correct_user
    redirect_to root_path if @task.user != current_user
  end
  

end
