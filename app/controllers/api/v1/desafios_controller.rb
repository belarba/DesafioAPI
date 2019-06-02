module Api
  module V1
    class DesafiosController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        events = Desafio.all
        render json: { status: 'SUCCESS', message: 'Loaded events', data: events }, status: :ok
      end

      def show
        event = Desafio.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded event', data: event }, status: :ok
      end

      def create
        event = Desafio.new(event_params)

        if event.save
          render json: { status: 'SUCCESS', message: 'Saved event', data: event }, status: :ok
        else
          render json: { status: 'ERROR', message: 'event not saved', data: event.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        event = Desafio.find(params[:id])
        event.destroy
        render json: { status: 'SUCCESS', message: 'Deleted event', data: event }, status: :ok
      end

      def update
        event = Desafio.find(params[:id])
        if event.update_attributes(event_params)
          render json: { status: 'SUCCESS', message: 'Updated event', data: event }, status: :ok
        else
          render json: { status: 'ERROR', message: 'event not updated', data: event.errors }, status: :unprocessable_entity
        end
      end

      private

      def event_params
        params.permit(:event, :timestamp)
      end

    end
  end
end
