class TodosController < ApplicationController

  def new

  end

  def show
    @todo = Todo.find params[:id]
    authorize @todo
  end

  def index
    @todos = Todo.visible_to(current_user).where("todos.created_at > ?",7.days.ago)
    authorize @todos
  end

  def destroy
    @todo = Todo.find(params[:id])
    description = @todo.description

    if @todo.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to @todos
    else
      flash[:error] = "There was an error deleting the todo."
      render :index
    end
  end

  def create

    @todo = current_user.todos.build(params.require(:todo).permit(:description))

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