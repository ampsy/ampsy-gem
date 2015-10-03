module Ampsy
  class Client
    def initialize(access_token = nil, host = 'https://ampsy.com')
      @access_token = access_token
      @host = host
    end

    def overview
      get 'overview'
    end

    def flips(flipbook_id, timestamp = nil)
      raise ArgumentError, 'flipbook_id is required' unless flipbook_id

      params = {}
      params[:timestamp] = timestamp if timestamp
      get "flipbooks/#{flipbook_id}/flips", params
    end

    def create_flipbook(brand_id, attributes)
      raise ArgumentError, 'brand_id is required' unless brand_id
      raise ArgumentError, 'attributes are required' unless attributes

      create "brands/#{brand_id}/flipbooks", data: attributes
    end

    def plans
      get 'plans'
    end

    def subscription(brand_id)
      raise ArgumentError, 'brand_id is required' unless brand_id

      get "brands/#{brand_id}/subscription"
    end

    def create_card(attributes)
      raise ArgumentError, 'attributes are required' unless attributes

      post 'cards', card: attributes
    end

    def subscribe(brand_id, plan_id, card_token, promo_code = nil)
      raise ArgumentError, 'brand_id is required' unless brand_id
      raise ArgumentError, 'plan_id is required' unless plan_id
      raise ArgumentError, 'card_token is required' unless card_token

      params = { plan_id: plan_id,
                 card: card_token }
      params[:promo] = promo_code if promo_code
      put "brands/#{brand_id}/subscription", params
    end

    def connect_account(brand_id, provider, account_id)
      raise ArgumentError, 'brand_id is required' unless brand_id
      raise ArgumentError, 'provider is required' unless provider
      raise ArgumentError, 'account_id is required' unless account_id

      post "brands/#{brand_id}/accounts/#{provider}", account_id: account_id
    end

    def disconnect_account(brand_id, provider)
      raise ArgumentError, 'brand_id is required' unless brand_id
      raise ArgumentError, 'provider is required' unless provider

      delete "brands/#{brand_id}/accounts/#{network}"
    end

    def current_user
      get 'user'
    end

    private

    def get(path, params = {})
      request(:get, path, params).data
    end

    def post(path, data = nil)
      request :post, path, data
    end

    def create(path, data = nil)
      request :post, path, data, 201
    end

    def put(path, data = nil)
      request :put, path, data
    end

    def delete(path)
      request :delete, path
    end

    def request(method, path, params, success_status = 200)
      params = { access_token: @access_token }.merge params
      result = HTTParty.send method, url(path), query: params
      Response.new result, success_status
    end

    def url(path)
      "#{@host}/api/v1/#{path}"
    end
  end
end
