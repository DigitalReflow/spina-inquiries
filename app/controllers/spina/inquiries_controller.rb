# frozen_string_literal: true

module Spina
  class InquiriesController < Spina::ApplicationController
    before_action :set_page
    before_action :check_spam, only: :create

    layout "default/application"

    def index
      @inquiry = Spina::Inquiry.new
    end

    def create
      @inquiry = Spina::Inquiry.new(inquiry_params)

      if @inquiry.save
        Spina::InquiryMailer.inquiry(@inquiry).deliver_now
        redirect_to spina.inquiries_url, notice: "Thank you for your message!"
      else
        render :index
      end
    end

    def thanks; end

  private

    def inquiry_params
      params.require(:inquiry).permit(:read, :email, :message, :name, :phone)
    end

    def set_page
      @page = Spina::Page.find_or_create_by!(name: "contact") do |page|
        page.title = "Contact"
        page.view_template = "show"
        page.link_url = "/contact"
        page.deletable = false
      end
    end

    def check_spam
      scope = controller_name.singularize
      honeypot = (Inquiry::HONEYPOTS & params[scope].keys).first

      if params[scope][honeypot.to_sym].present?
        redirect_to root_path
      else
        params.delete(honeypot)
      end
    end
  end
end
