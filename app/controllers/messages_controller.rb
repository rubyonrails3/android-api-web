class MessagesController < ApplicationController

  def create
    registration_ids = Device.pluck(:token)
    if registration_ids.any?
      data = params.slice(:activity, :seconds, :enable, :disable)
      data[:action] = data.delete(:activity)
      p data
      req = HTTPPost.new(uri: 'https://gcm-http.googleapis.com/gcm/send', body: { data: data, registration_ids: registration_ids }.to_json)
      req.start
    end
    redirect_to root_path, notice: 'Request sent.'
  end
end
