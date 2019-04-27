Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'localhost:3000'
    origins 'https://gallant-hodgkin-20f36d.netlify.com'
    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end
end
