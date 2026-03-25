module RESTFramework
    module Utils
        class << self
            alias_method :original_get_routes, :get_routes

            def get_routes(application_routes, request, current_route: nil)
                current_route ||= get_request_route(application_routes, request)
                current_route = current_route.first if current_route.is_a?(Array)

                return [] if current_route.nil?

                original_get_routes(application_routes, request, current_route: current_route)
            rescue NoMethodError => e
                raise unless e.message.include?("undefined method 'path'")
                []
            end
        end
    end
end
