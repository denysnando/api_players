# frozen_string_literal: true

class ApplicationSerializer
  include JSONAPI::Serializer

  def to_h
    data = serializable_hash
    case data[:data]
    when Hash
      data[:data][:attributes]
    when Array
      data[:data].pluck(:attributes)
    end
  end
end
