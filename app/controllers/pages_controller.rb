class PagesController < ApplicationController
  def home
    if params[:search].present?
      country_select = search_params[:country] if search_params[:country] != 'All'
    end

    @countries = countries_list
    @nb_customers = nb_customers(country_select)
    @total_revenue = total_revenue(country_select).fdiv(1_000).round(0)
    @average_revenue = (@total_revenue * 1_000).fdiv(nb_orders(country_select)).round(1)
    @months = graph(country_select)[0]
    @revenues_per_month = graph(country_select)[1]
  end

  private

  # Find all countries with customers
  def countries_list
    countries = ['All']
    Customer.find_each do |customer|
      countries << customer.country unless countries.include?(customer.country)
    end
    return countries
  end

  # Return the number of cutomers for each country or all countries
  def nb_customers(country)
    if country
      Customer.where(country: country).count
    else
      Customer.count
    end
  end

  # Return the number of orders for country or all
  def nb_orders(country)
    count = 0
    if country
      Customer.where(country: country).each do |customer|
        count += customer.orders.count
      end
    else
      count = Order.count
    end
    return count
  end

  # Return total revenue for country or for all order
  def total_revenue(country)
    total_revenue = 0
    if country
      Customer.where(country: country).each do |customer|
        customer.orders.each do |order|
          total_revenue += order.total_price
        end
      end
    else
      OrderProduct.find_each { |product| total_revenue += product.quantity * product.unit_price }
    end
    return total_revenue
  end

  def graph(country)
    orders = []
    if country
      Customer.where(country: country).each { |customer| orders += customer.orders }
    else
      orders = Order.all
    end

    last_order = orders.max_by { |order| order.date }
    last_order_month = last_order.date.month

    months = []
    revenues = []

    (0..11).each do |i|
      month = (last_order_month + i) % 12 + 1
      month_orders = orders.select { |order| order.date.month == month }
      revenues << month_orders.reduce(0) { |sum, order| sum + order.total_price.fdiv(1_000).round(0) }
      months << Date.new(2020, month, 1).strftime("%B")
    end

    return [months, revenues]
  end

  def search_params
    params.require(:search).permit(:country)
  end
end
