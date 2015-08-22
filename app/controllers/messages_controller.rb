class MessagesController < ApplicationController

  def create
    registration_ids = Device.pluck(:token)
    p message_params
    if false && registration_ids.any?
      req = HTTPPost.new(uri: 'https://gcm-http.googleapis.com/gcm/send', body: { data: message_params, registration_ids: registration_ids }.to_json)
      req.start
    end
    redirect_to root_path, notice: 'Request sent.'
  end


  def message_params
    if params[:activity].to_s == 'call_recordings'
      { action: params[:activity], request: params.key?(:enable) }
    elsif params[:activity].to_s == 'location'
      { action: params[:activity], request: true }
    else
      { action: params[:activity], request: params[:seconds].to_i * 100 }
    end
  end
end
