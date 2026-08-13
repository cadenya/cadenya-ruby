# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ResolvedSecret < Cadenya::Internal::Type::BaseModel
        # @!attribute key
        #
        #   @return [String]
        required :key, String

        # @!attribute source
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ResolvedSecret::Source]
        required :source, enum: -> { Cadenya::Objectives::ResolvedSecret::Source }

        # @!method initialize(key:, source:)
        #   ResolvedSecret is a resolved secret value from the workspace, toolset, or
        #   objective. When a tool is called, it will rely on secrets in the order of:
        #
        #   - Objective
        #   - Toolset
        #   - Workspace
        #
        #   @param key [String]
        #   @param source [Symbol, Cadenya::Models::Objectives::ResolvedSecret::Source]

        # @see Cadenya::Models::Objectives::ResolvedSecret#source
        module Source
          extend Cadenya::Internal::Type::Enum

          RESOLVED_SECRET_SOURCE_UNSPECIFIED = :RESOLVED_SECRET_SOURCE_UNSPECIFIED
          RESOLVED_SECRET_SOURCE_WORKSPACE = :RESOLVED_SECRET_SOURCE_WORKSPACE
          RESOLVED_SECRET_SOURCE_TOOLSET = :RESOLVED_SECRET_SOURCE_TOOLSET
          RESOLVED_SECRET_SOURCE_OBJECTIVE = :RESOLVED_SECRET_SOURCE_OBJECTIVE

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
