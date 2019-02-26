Clearance.configure do |config|
  config.allow_sign_up = true
  config.mailer_sender = "reply@example.com"
  config.cookie_domain = Rails.env.production? ? '.example.com' : 'localhost:3000'
  config.rotate_csrf_on_sign_in = true
end
