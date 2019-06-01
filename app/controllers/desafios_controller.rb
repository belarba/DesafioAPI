class DesafiosController < ApplicationController
  def test

  end

  def input_insert
    params[:timestamp] = Time.now
    desafio = Desafio.new(event_params)
    desafio.save
    redirect_to test_path
  end

  private

  def event_params
    params.permit(:event, :timestamp)
  end

end
