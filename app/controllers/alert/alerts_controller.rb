module Alert
  class AlertsController < ApplicationController
    before_action :set_alert, only: [:show, :edit, :update, :destroy]

    # GET /alert/leds
    def index
      @alerts = ::Alert::Alert.all
    end

    # GET /alert/leds/1
    def show
    end

    # GET /alert/leds/new
    def new
      redirect_to alerts_url, notice: 'You are not authorized to do that.'
    end

    # GET /alert/leds/1/edit
    def edit
    end

    # POST /alert/leds
    def create
      @alert = ::Alert::Alert.new(alert_params)

      if @alert.save
        redirect_to alert_path(@alert), notice: 'Alert was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /alert/leds/1
    def update
      if @alert.update(alert_params)
        redirect_to alert_path(@alert), notice: 'Alert was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /alert/leds/1
    def destroy
      @alert.destroy
      redirect_to alerts_url, notice: 'alert was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_alert
        @alert = ::Alert::Alert.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def alert_params
        params.fetch(:alert_alert, {}).permit(:id, :apiotics_instance, :led_attributes => ["led_state", "id"], :button_attributes => ["safe", "id"])
      end
  end
end