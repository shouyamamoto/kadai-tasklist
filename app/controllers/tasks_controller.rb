class TasksController < ApplicationController
  # before_action は、アクションが実行される前に、前もって実行すべきメソッドを指定できます。
  # only: [...] によって、set_message を前もって実行するアクション一覧を指定している。
  
  before_action :set_task, only: [:show, :edit, :uptate, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Task が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が作成されませんでした'
      render :new
    end
  end
  
  def new
    @task = Task.new
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end

