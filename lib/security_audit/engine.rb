module SecurityAudit
    class Engine < ::Rails::Engine
        insolate_namespace SecurityAudit

        initializer "security_audit.mount_routes" do |app|
            app.routes.prepend do
                mount SecurityAudit::Engine => "/"
            end
        end
    end
end
