module Api
    module V1
      class GoalsController < ApplicationController
        before_action :set_goal, only: [:show, :update, :destroy]

        # GET /goals
        def index
          @goals = Goal.all
          json_response(@goals)
      end
    
      # POST /goals
      def create
        @goal = Goal.create(goal_params)
        json_response(@goal)
      end
    
      # GET /goals/:id
      def show
        json_response(@goal)
      end
    
      # DELETE /goals/:id
      def destroy
        @goals.destroy
        head :no_content
      end
    
      private
    
      def goal_params
          # whitelist params
          params.permit(:title)
      end
    
      def set_goal
        @goal = Goal.find(params[:id])
      end
      end
    end
  end        