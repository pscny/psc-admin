module SimpleSessions

  module ClassMethods
    def config(&block)
      block.call(new self)
    end
  end

end
