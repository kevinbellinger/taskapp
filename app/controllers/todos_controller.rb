class TodosController < ApplicationController

  respond_to :html, :js
  
  def new

  end

  def show
    @todo = current_user.todos.find(params[:id])
    authorize @todo
  end

  def index
    @todo = Todo.new
    @todos = current_user.todos.where(completed: false)
    authorize @todos
  end

 def update
    @todo = current_user.todos.find(params[:todo_id])
    authorize @todo
    if @todo.update_attributes(todo_params)
      flash[:notice] = "Todo was updated."
      redirect_to [@todo]
    else
      flash[:error] = "There was an error updating the todo. Please try again."
      render :new
    end
  end


 # def destroy
  #  @todo = current_user.todos.find(params[:todo_id])
   # if @todo.destroy
    #  flash[:notice] = "\"#{name}\" was deleted successfully."
     # redirect_to @todos
  #  else
   #   flash[:error] = "There was an error deleting the todo."
    #  render :index
  #  end
 # end

def destroy
    @todo = Todo.find params[:id]
    authorize @todo
    desc = @todo.description
    if @todo.destroy
      flash[:notice] = "The todo #{desc} was deleted successfully."
    else
      flash[:error] = "There was an error deleting the Todo item"
    end

    respond_with(@todo) do |f|
      f.html { redirect_to todos_path }
    end
  end






  def create

    @todo = current_user.todos.build(todo_params)

      if @todo.save
        flash[:notice] = 'Your new TODO was saved'
        redirect_to todos_path 
      else
        flash[:notice] = 'Your TODO was not saved'
        render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end