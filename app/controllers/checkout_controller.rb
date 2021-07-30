class CheckoutController < ApplicationController

  def create
    line_items = []
    total = 0
    @products = eval(params[:cart])
    @products.each do |prod, qty|
      puts "#{prod} #{qty}"

      product = Book.find(prod)

      if product.nil?
        redirect_to root_path
      end

      cost = 0

      if product.on_sale
        cost = product.sale_price
      else
        cost = product.price
      end

      total = total + cost * qty

      hash = {
        name: product.title,
        description: "#{product.title} written by #{product.author.name} - Published: #{product.published_year}",
        amount: (cost * 100).to_i,
        currency: "cad",
        quantity: qty,
      }
      line_items << hash
    end

    customer = Customer.find(current_customer.id)

    if customer.province.gst > 0
      gst = {
        name: "GST",
        description: "Goods and Services Tax",
        amount: (total * 100 * customer.province.gst).to_i,
        currency: "cad",
        quantity: 1
      }
      line_items << gst
    end

    if customer.province.pst > 0
    pst = {
      name: "PST",
      description: "Provincial Sales Tax",
      amount: (total * 100 * customer.province.pst).to_i,
      currency: "cad",
      quantity: 1
    }
      line_items << pst
    end

    if customer.province.hst > 0
      hst = {
      name: "HST",
      description: "Harmonized Sales Tax",
      amount: (total * 100 * customer.province.hst).to_i,
      currency: "cad",
      quantity: 1
    }
      line_items << hst
    end


    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: line_items
    )

    respond_to do |format|
      format.js
    end
  end

  def success

  end

  def cancel
  end
end
