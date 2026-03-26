class Api::RootController < ApiController
    def root
        @books_path = "/api/books"

        respond_to do |format|
            format.html
            format.json do
                render json: {
                    message: "Welcome to the Book Tracker",
                    endpoints: {
                        books: "/api/books"
                    }
              }
            end
        end
    end
end
