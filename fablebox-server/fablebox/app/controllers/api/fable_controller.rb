class Api::FableController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def list

    query = Fable.where('enabled = ?', true)

    if(params[:langs])
      query = query.where('language IN (?)', params[:langs].split(','))
    end

    if(params[:no_paids])
      query = query.where('is_paid = ?', 0)
    end

    @fables = query.order('date_added DESC')
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
