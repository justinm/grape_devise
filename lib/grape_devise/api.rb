module GrapeDevise::API
  def devise_for *resources
    resources.each do |resource|
      mapping = resource.to_s.singularize
      instance_eval <<-METHODS, __FILE__, __LINE__ + 1
        helpers do
          require "net/http/responses"
          def warden
            env['warden']
          end

          def #{mapping}_signed_in?
            !!current_#{mapping}
          end

          def authenticate_#{mapping}
            @current_#{mapping} ||= warden.authenticate(scope: :#{mapping})
          end

          def authenticate_#{mapping}!
            raise Grape::Errors::NotFound
            #raise "401: Unauthorized" unless authenticate_#{mapping}

            current_#{mapping}
          end

          def current_#{mapping}
            @current_user
          end

          def #{mapping}_session
            current_#{mapping} && warden.session(:#{mapping})
          end
        end
      METHODS
    end
  end
end