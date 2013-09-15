class Api::NotificationController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def fable_added
    # user = User.find_by 'id = ?', params[:id]
    user = User.find(params[:id])

    APNS.host = 'gateway.push.apple.com'
    APNS.pem = 'app/assets/outagetracker_apns_production.pem'
    APNS.pass = '1insan'
    device_token = user.push_id

    #APNS.send_notification(device_token, 'Kesinti var yeeenn!')
    APNS.send_notification(device_token, alert: 'Yeni masal geldi :)', badge: 1, sound: 'default')

    render json: user
  end

  def fable_added2
    # user = User.find_by 'id = ?', params[:id]
    user = User.find(params[:id])

    APNS.host = 'gateway.sandbox.push.apple.com'
    APNS.pem = 'app/assets/outagetracker_apns_development.pem'
    APNS.pass = '1insan'
    device_token = user.push_id

    #APNS.send_notification(device_token, 'Kesinti var yeeenn!')
    APNS.send_notification(device_token, alert: 'Yeni masal geldi :)', badge: 1, sound: 'default')

    render json: user
  end




end
