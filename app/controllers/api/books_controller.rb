class Api::BooksController < ApiController
    include RESTFramework::ModelControllerMixin
  
    self.fields = [:id, :title, :author, :genre, :rating, :read_status, :published_on, :created_at, :updated_at]
    self.allowed_parameters = [:title, :author, :genre, :rating, :read_status, :published_on]
    self.ordering_fields = [:id, :title, :author, :rating, :published_on, :created_at]
    self.search_fields = [:title, :author, :genre]
  
    def index
      @books = Book.all
      render :index
    end
  
    def show
      @book = Book.find(params[:id])
      render :show
    end
  
    def new
      @book = Book.new
      render :new
    end
  
    def create
      @book = Book.new(book_params)
  
      if @book.save
        redirect_to "/api/books"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @book = Book.find(params[:id])
      render :edit
    end
  
    def update
      @book = Book.find(params[:id])
  
      if @book.update(book_params)
        redirect_to "/api/books"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to "/api/books"
    end
  
    def options
      @options_data = {
        resource: "books",
        methods: ["GET", "POST", "OPTIONS"],
        item_methods: ["GET", "PATCH", "PUT", "DELETE"],
        routes: {
          index: "/api/books",
          create: "/api/books",
          show: "/api/books/:id",
          update: "/api/books/:id",
          delete: "/api/books/:id"
        }
      }
  
      render :options
    end
  
    private
  
    def book_params
      params.require(:book).permit(:title, :author, :genre, :rating, :read_status, :published_on)
    end
  end