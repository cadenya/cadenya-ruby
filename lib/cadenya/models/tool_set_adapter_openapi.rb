# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSetAdapterOpenAPI
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :url, -> { Cadenya::ToolSetAdapterOpenAPIURL }

      variant :uploadId, -> { Cadenya::ToolSetAdapterOpenAPIUploadID }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::ToolSetAdapterOpenAPIURL, Cadenya::Models::ToolSetAdapterOpenAPIUploadID)]
    end
  end
end
