class ApiController < ApplicationController
    include RESTFramework::BaseControllerMixin

    self.paginator_class = RESTFramework::PageNumberPaginator
    self.page_size = 10
    self.max_page_size = 50
end