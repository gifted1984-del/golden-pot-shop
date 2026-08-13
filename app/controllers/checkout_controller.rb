class CheckoutController < ApplicationController
  DEMO_CARD_NUMBER = "4242424242424242".freeze

  before_action :set_product

  def new
  end

  def preview
    @checkout = checkout_params
    @card_digits = @checkout[:card_number].to_s.delete(" ")
    @errors = checkout_errors

    if @errors.any?
      render :new, status: :unprocessable_content
    else
      @last4 = @card_digits.last(4)
      render :preview
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id] || params.dig(:checkout, :product_id))
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "デモ購入フローを開始する商品を選択してください。"
  end

  def checkout_params
    params.expect(checkout: %i[product_id cardholder_name card_number expiry_date cvc agreement])
  end

  def checkout_errors
    errors = []
    errors << "カード名義を入力してください。" if @checkout[:cardholder_name].blank?
    errors << "テストカード番号 4242 4242 4242 4242 を入力してください。" unless @card_digits == DEMO_CARD_NUMBER
    errors << "有効期限を MM / YY 形式で入力してください。" unless @checkout[:expiry_date].to_s.match?(/\A(0[1-9]|1[0-2])\s*\/\s*\d{2}\z/)
    errors << "3桁のテスト用セキュリティコードを入力してください。" unless @checkout[:cvc].to_s.match?(/\A\d{3}\z/)
    errors << "デモであることへの同意が必要です。" unless @checkout[:agreement] == "1"
    errors
  end
end
