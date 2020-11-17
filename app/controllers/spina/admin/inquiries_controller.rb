# frozen_string_literal: true

module Spina
  module Admin
    class InquiriesController < AdminController
      before_action :inquiries_count, only: %w[index read]
      before_action :set_inquiry, only: %w[show destroy mark_as_read]

      layout "spina/admin/admin"

      def show
        add_breadcrumb I18n.t("spina.inquiries.title"), spina.admin_inquiries_path
        add_breadcrumb @inquiry.name
      end

      def index
        add_breadcrumb I18n.t("spina.inquiries.title"), spina.admin_inquiries_path
        @inquiries = Spina::Inquiry.newest_first.not_marked_as_read
      end

      def read
        add_breadcrumb I18n.t("spina.inquiries.read"), spina.read_admin_inquiries_path
        @inquiries = Spina::Inquiry.newest_first.marked_as_read
      end

      def destroy
        @inquiry.destroy
        redirect_to spina.admin_inquiries_path
      end

      def mark_as_read
        @inquiry.update(read: true)
        redirect_to spina.admin_inquiries_path
      end

    private

      def inquiry_params
        params.require(:inquiry).permit(:read, :email, :message, :name, :phone)
      end

      def set_inquiry
        @inquiry = Spina::Inquiry.find(params[:id])
      end

      def inquiries_count
        inquiries = Spina::Inquiry.all

        @inquiries_read_count = inquiries.marked_as_read.count
        @inquiries_not_read_count = inquiries.not_marked_as_read.count
      end
    end
  end
end
