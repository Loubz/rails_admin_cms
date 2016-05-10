module CMS
  class MailchimpController < RailsAdminCMS::Config.parent_controller
    invisible_captcha only: [:subscribe]

    def subscribe
      respond_to do |format|
        format.js do
          begin
            md5_email = Digest::MD5.hexdigest(params[:mailchimp][:email].downcase)
            gibbon = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
            gibbon.lists(Rails.application.secrets.send(:"mailchimp_list_id_#{I18n.locale}"))
                  .members(md5_email)
                  .upsert(body: {
                    email_address: params[:mailchimp][:email],
                    status: "pending"
                  })
            flash_now!(:success)
          rescue Gibbon::MailChimpError => exception
            puts exception.to_s
            cms_logger exception, 'mailchimp'
            flash_now!(:error)
          end
        end
      end
    end
  end
end
