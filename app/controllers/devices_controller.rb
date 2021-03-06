class DevicesController < ApplicationController

  def index
    devices = Device.all
    render action: :index, locals: { devices: devices }
  end

  def create
    device_id = device_params.delete(:device_id)
    device = Device.create_with(device_params).find_or_initialize_by device_id: device_id
    device.persisted? ? device.update(device_params) : device.save
    render json: device.as_json(only: [:id, :device_id, :token, :name])
  end

  def update
    device = Device.find_by(device_id: params[:device_id])
    render json: device.as_json(only: [:id, :device_id, :token, :name])
  end

  def destroy
    device = Device.find_by(device_id: params[:device_id])
    device.destroy
    head :no_content
  end

  private

  def device_params
    params.require(:device).permit(:device_id, :token, :name)
  end
end
