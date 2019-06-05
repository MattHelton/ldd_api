module Api
  module V1
    class ActivitiesController < ApplicationController
        before_action :set_activity, only: [:show, :update, :destroy]
    
        # GET /activities
        def index
            @activities = Activity.all
            json_response(@activities)
        end
      
        # POST /activities
        def create
          @activity = Activity.create(activity_params)
          json_response(@activity, created)
        end
      
        # GET /activities/:id
        def show
          json_response(@activity)
        end
      
        # DELETE /activities/:id
        def destroy
          @activities.destroy
          head :no_content
        end
      
        private
      
        def activity_params
            # whitelist params
            params.permit(:name)
        end
      
        def set_activity
          @activity = Activity.find(params[:id])
        end
      
    end
  end
end