module Guardian
  class AccessDenied < StandardError

    attr_reader :action, :resource
    attr_writer :default_message

    def initialize(message = nil, action = nil, resource = nil)
      @message = message
      @action = action
      @resource = resource
      @default_message = "access this resource is denied for you."
    end

    def to_s
      @message || @default_message
    end
  end
end