class Api::FableController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def list

    if(params[:lang])
      selected_langs = params[:lang].split(',')
    else
      selected_langs = ['en']
    end

    @fables = Fable.where("language IN (?)", selected_langs)
    render json: @fables
  end

  def audio
    file_path = Api::PATH_FABLE_AUDIO + params[:guid]
    send_file file_path
    headers['Content-Length'] = File.size(file_path).to_s
  end

  def image_small
    file_path = Api::PATH_FABLE_IMAGE_SMALL + params[:guid]
    send_file file_path
    headers['Content-Length'] = File.size(file_path).to_s
  end

  def image_large
    file_path = Api::PATH_FABLE_IMAGE_LARGE + params[:guid]
    send_file file_path
    headers['Content-Length'] = File.size(file_path).to_s
  end



end
