# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::GlobalAPIKey#enable
    class GlobalAPIKeyEnableParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
