# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :apply_filters, only: :index

  def index
    @orders ||= Order.all
  end

  def create
    order_params = params.require(:order).permit(:control_number)

    @order = Order.create(order_params)

    return render 'error' unless @order.persisted?

    redirect_to action: 'index'
  end

  def update
    id = params.require(:id)
    to_state = params.require(:to_state)

    @order = Order.find(id)

    @order.save if @order.send(to_state)

    redirect_to request.referrer
  end

  private

  def apply_filters
    permitted = params.permit(:state, :control_number)

    filter_state(permitted[:state])
    filter_control_number(permitted[:control_number])
  end

  def filter_state(state)
    return unless state.present?

    @orders = @orders&.send(state) || Order.send(state)
  end

  def filter_control_number(control_number)
    return unless control_number.present?

    @orders =
      @orders&.by_control_number(control_number) ||
      Order.by_control_number(control_number)
  end
end
