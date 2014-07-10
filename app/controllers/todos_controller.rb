class TodosController < ApplicationController

  def new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def index
    @todos = Todo.all
  end

  def destroy
    @todo = Todo.find(params[:id])
    description = @todo.description

    if @todo.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to todos_path
    else
      flash[:error] = "There was an error deleting the todo."
      render :index
    end
  end

  def create
    @todo = Todo.new(todo_params)
      if @todo.save
        flash[:notice] = 'Your new TODO was saved'
        redirect_to @todo
      else
        flash[:notice] = 'Your TODO was not saved'
        render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:id, :description)
  end
end