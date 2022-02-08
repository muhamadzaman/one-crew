class Base
  def self.execute(*args)
    interactor = new(*args)
    interactor.send(:execute)
  end

  private

    def execute
      raise NotImplementedError
    end
end