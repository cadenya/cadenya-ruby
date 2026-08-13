# frozen_string_literal: true

module Cadenya
  module Models
    class AccountSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute billing_email
      #
      #   @return [String]
      required :billing_email, String, api_name: :billingEmail

      # @!attribute description
      #
      #   @return [String]
      required :description, String

      # @!attribute domain
      #
      #   @return [String]
      required :domain, String

      # @!attribute workspaces
      #
      #   @return [Array<Cadenya::Models::Workspace>]
      required :workspaces, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Workspace] }

      # @!method initialize(billing_email:, description:, domain:, workspaces:)
      #   Configuration for an account.
      #
      #   @param billing_email [String]
      #   @param description [String]
      #   @param domain [String]
      #   @param workspaces [Array<Cadenya::Models::Workspace>]
    end
  end
end
