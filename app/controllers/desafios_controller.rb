require 'open-uri'
require 'json'

class DesafiosController < ApplicationController
  def test

  end

  def input_insert
    params[:timestamp] = Time.now
    desafio = Desafio.new(event_params)
    desafio.save
    redirect_to test_path
  end

  def manipulation
    require 'open-uri'
    require 'json'

    def transaction(hash, evento, products, hash2)
      unless hash['product_name'].nil?
        products << "name: #{hash['product_name']}"
        products << "price: #{hash['product_price']}"
      end

      hash2['timestamp'] = evento['timestamp']
      hash2['revenue'] = evento['revenue'] unless evento['revenue'].nil?
      hash2['transaction_id'] = hash['transaction_id']
      hash2['store_name'] = hash['store_name'] unless hash['store_name'].nil?
    end

    def add_timeline(hash2, products, timeline)
      hash2['products'] = products
      products = []
      timeline << hash2
    end

    def le_json
      timeline = []
      products = []
      hash = {}
      hash2 = {}
      transaction_id = ''
      compras_origem = open('https://storage.googleapis.com/dito-questions/events.json').read
      compras = JSON.parse(compras_origem)
      compras['events'].each do |evento|
        evento['custom_data'].each do |custom|
          hash[custom['key']] = custom['value']
        end
        transaction_id = hash['transaction_id'] if transaction_id == ''
        if transaction_id == hash['transaction_id']
          transaction(hash, evento, products, hash2)
        else
          add_timeline(hash2, products, timeline)
          hash2 = {}
          transaction_id = hash['transaction_id']
          transaction(hash, evento, products, hash2)
        end
        hash = {}
      end
      add_timeline(hash2, products, timeline)
      timeline
    end

    le_json

    render json: { timeline: le_json.sort_by { |hsh| hsh['timestamp'] }.reverse }, status: :ok
  end

  private

  def event_params
    params.permit(:event, :timestamp)
  end



end
