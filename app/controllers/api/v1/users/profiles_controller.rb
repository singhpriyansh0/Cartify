# frozen_string_literal: true

class Api::V1::Users::ProfilesController < ApplicationController
  before_action :authenticate
  # before_action :configure_account_update_params, only: [:update]
  respond_to :json
  def show
    render json: current_user, status: :ok
  end

end
