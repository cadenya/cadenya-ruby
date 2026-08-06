# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::TenantsTest < Cadenya::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tenants.retrieve("id", workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Tenant
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        state: Cadenya::Tenant::State,
        info: Cadenya::TenantInfo | nil
      }
    end
  end

  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tenants.list(workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Internal::CursorPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Cadenya::Tenant
    end

    assert_pattern do
      row => {
        metadata: Cadenya::ResourceMetadata,
        state: Cadenya::Tenant::State,
        info: Cadenya::TenantInfo | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.tenants.delete("id", workspace_id: "workspace_01HXKD2E5NQM3T9AYWCF133E3Q")

    assert_pattern do
      response => Cadenya::Tenant
    end

    assert_pattern do
      response => {
        metadata: Cadenya::ResourceMetadata,
        state: Cadenya::Tenant::State,
        info: Cadenya::TenantInfo | nil
      }
    end
  end
end
