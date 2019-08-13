class TasksController < ApplicationController
  # before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @task.save
  end

  def create
    @task = Task.create
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id]) # GET /restaurants/:id/edit
    @task.update(task_params)
    redirect_to tasks_path(@tasks)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@tasks) # DELETE /restaurants/:id
  end
end

private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end
