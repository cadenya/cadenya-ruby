# frozen_string_literal: true

module Cadenya
  module Models
    class AccountSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute billing_email
      #
      #   @return [String, nil]
      optional :billing_email, String, api_name: :billingEmail

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute domain
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute workspaces
      #
      #   @return [Array<Cadenya::Models::Workspace>, nil]
      optional :workspaces, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Workspace] }

      # @!method initialize(billing_email: nil, description: nil, domain: nil, workspaces: nil)
      #   Configuration for an account.
      #
      #   @param billing_email [String]
      #   @param description [String]
      #   @param domain [String]
      #   @param workspaces [Array<Cadenya::Models::Workspace>]
    end
  end
end
