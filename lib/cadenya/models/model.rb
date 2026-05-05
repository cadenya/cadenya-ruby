# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Models#retrieve
    class Model < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #   Model specification
      #
      #   @return [Cadenya::Models::ModelSpec]
      required :spec, -> { Cadenya::ModelSpec }

      # @!method initialize(metadata:, spec:)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Model}
      #   for more details.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::ModelSpec] Model specification
    end
  end
end
