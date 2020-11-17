module Spina
  module Inquiries
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Inquiries

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = "Inquiries"
          plugin.namespace = "inquiries"
        end
      end

      config.to_prepare do
        Rails.application.config.assets.precompile += %w[spina/inquiries/admin/inquiries.css]
      end

      ActiveSupport.on_load(:action_view) do
        include Spina::InquiriesHelper
        include Spina::Inquiries::AdminHelpers
      end
    end
  end
end
