class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def create
    todo = Todo.new(todo_params)

    if todo.valid?
      todo.save!
      render json: todo
    else
      render json: { error_messages: todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.permit(:description)
  end
end
