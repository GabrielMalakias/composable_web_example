class Repository::Author
  class << self
    def create(params)
      Application::DB[:authors].insert(params)
    end

    def update(params)
      Application::DB[:authors].where(Sequel[:id] = params[:id])
        .update(params.except(:id))
    end

    def find(id)
      Application::DB[:authors].where(id: id).first
    end
  end
end
