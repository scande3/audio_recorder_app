class RecordingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def home

  end

  def handle_upload
    @audio_data = params[:audio_data].path
    data = File.read(@audio_data)
    full_path = Rails.root.join('public', 'uploads', SecureRandom.uuid + ".wav").to_s
    directory = Rails.root.join('public', 'uploads').to_s
    FileUtils.mkpath directory
    File.open(full_path, 'wb' ) do |output|
        output.write data
    end

    @audio_path = full_path
  end
end