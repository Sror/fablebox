class Api::UserController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def register
    @user = User.new(apple_id: params[:apple_id], push_id: params[:push_id])
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def purchase_fable

    purchased_fable = PurchasedFable.new()

    purchased_fable.user = User.find(params[:user_id])
    purchased_fable.fable = Fable.find(params[:fable_id])
    purchased_fable.date_purchased = DateTime.now.to_date

    # TODO

    if purchased_fable.save
      render json: purchased_fable, status: :created
    else
      render json: purchased_fable.errors, status: :unprocessable_entity
    end
  end

end
