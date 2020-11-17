module Spina
  module InquiriesHelper
    def inquiries_captcha
      honeypot = Inquiry::HONEYPOTS.sample
      content_tag :input, nil, id: "inquiry_#{honeypot}", name: "inquiry[#{honeypot}]", type: :hidden
    end
  end
end