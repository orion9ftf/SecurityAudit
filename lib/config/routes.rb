SecurityAudit::Engine.routes.draw do
    get "/security_dashboard", to: "dashboard#index"
end
