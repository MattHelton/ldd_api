module Api
    module V1
      class GoalsController < ApplicationController
        def index
          goals = Goal.order(created_at: :desc)
          render json: { status: 'SUCCESS', message: 'loaded goals', data: goals }
        end
  
        def show
          goal = Goal.find(params[:id])
          render json: { status: 'SUCCESS', message: 'loaded the goal', data: goal }
        end
  
        def create
          goal = Goal.new(goal_params)
          if goal.save
            render json: { status: 'SUCCESS', message: 'loaded the goal', data: goal }
          else
            render json: { status: 'ERROR', message: 'goal not saved', data: goal.errors }
          end
        end
  
        def destroy
          goal = Goal.find(params[:id])
          goal.destroy
          render json: { status: 'SUCCESS', message: 'deleted the goal', data: goal }
        end
  
        def update
          goal = Goal.find(params[:id])
          if goal.update(goal_params)
            render json: { status: 'SUCCESS', message: 'updated the goal', data: goal }
          else
            render json: { status: 'SUCCESS', message: 'loaded the goal', data: goal }
          end
        end

        private

        def goal_params
          params.require(:goal).permit(:title)
        end
      end
    end
  end        