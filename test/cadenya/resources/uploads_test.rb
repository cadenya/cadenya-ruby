# frozen_string_literal: true

require_relative "../test_helper"

class Cadenya::Test::Resources::UploadsTest < Cadenya::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @cadenya.uploads.create(
        workspace_id: "workspaceId",
        metadata: {name: "name"},
        spec: {contentType: "contentType", filename: "filename", sizeBytes: "sizeBytes"}
      )

    assert_pattern do
      response => Cadenya::Upload
    end

    assert_pattern do
      response => {
        info: Cadenya::UploadInfo,
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::UploadSpec
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @cadenya.uploads.retrieve("id", workspace_id: "workspaceId")

    assert_pattern do
      response => Cadenya::Upload
    end

    assert_pattern do
      response => {
        info: Cadenya::UploadInfo,
        metadata: Cadenya::ResourceMetadata,
        spec: Cadenya::UploadSpec
      }
    end
  end
end
