class Visitor
  include ActiveModel::Model
  attr_accessor :email

  validates_presence_of :email
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i

  def subscribe
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id   = Rails.application.secrets.mailchimp_list_id
    result    = mailchimp.lists(list_id).members.create(
                  body: {
                    email_address: self.email,
                    status:        'subscribed'
                  }
                )
    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
  end
end
