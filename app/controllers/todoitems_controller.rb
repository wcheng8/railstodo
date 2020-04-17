class TodoitemsController < ApplicationController
  before_action :set_todo_list
  def create
   @todoitem = @todolist.todoitems.create(todo_item_params)
   redirect_to @todolist
  end
  def destroy
    @todoitem = @todolist.todoitems.find(params[:id])
    if @todoitem.destroy
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todolist
  end
  def complete
    @todoitem = @todolist.todoitems.find(params[:id])
    @todoitem.update_attribute(:completed_at, Time.now)
    redirect_to @todolist, notice:"Todo item completed"
  end
  private
  def set_todo_list
   @todolist = Todolist.find(params[:todolist_id])
  end
  def todo_item_params
   params[:todoitem].permit(:content)
  end
  def set_todoitem
    @todoitem = @todolist.todoitems.find(params[:id])
  end

end
