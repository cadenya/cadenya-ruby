# frozen_string_literal: true

module Cadenya
  [Cadenya::Internal::Type::BaseModel, *Cadenya::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Cadenya::Internal::AnyHash) } }
  end

  Cadenya::Internal::Util.walk_namespaces(Cadenya::Models).each do |mod|
    case mod
    in Cadenya::Internal::Type::Enum | Cadenya::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Cadenya::Internal::Util.walk_namespaces(Cadenya::Models)
                         .lazy
                         .grep(Cadenya::Internal::Type::Union)
                         .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AccountAPI = Cadenya::Models::AccountAPI

  AccountInfo = Cadenya::Models::AccountInfo

  AccountResourceMetadata = Cadenya::Models::AccountResourceMetadata

  AccountRetrieveParams = Cadenya::Models::AccountRetrieveParams

  AccountRotateChallengeTokenParams = Cadenya::Models::AccountRotateChallengeTokenParams

  AccountRotateWebhookSigningKeyParams = Cadenya::Models::AccountRotateWebhookSigningKeyParams

  AccountSpec = Cadenya::Models::AccountSpec

  Agent = Cadenya::Models::Agent

  AgentArchiveParams = Cadenya::Models::AgentArchiveParams

  AgentCreateParams = Cadenya::Models::AgentCreateParams

  AgentDeleteParams = Cadenya::Models::AgentDeleteParams

  AgentInfo = Cadenya::Models::AgentInfo

  AgentListParams = Cadenya::Models::AgentListParams

  AgentPublishParams = Cadenya::Models::AgentPublishParams

  AgentRetrieveParams = Cadenya::Models::AgentRetrieveParams

  Agents = Cadenya::Models::Agents

  AgentSpec = Cadenya::Models::AgentSpec

  AgentUnarchiveParams = Cadenya::Models::AgentUnarchiveParams

  AgentUnpublishParams = Cadenya::Models::AgentUnpublishParams

  AgentUpdateParams = Cadenya::Models::AgentUpdateParams

  AIProviderConfigOpenAI = Cadenya::Models::AIProviderConfigOpenAI

  AIProviderConfigOpenAICompatible = Cadenya::Models::AIProviderConfigOpenAICompatible

  AIProviderConfigOpenrouter = Cadenya::Models::AIProviderConfigOpenrouter

  AIProviderCredentialAPIKey = Cadenya::Models::AIProviderCredentialAPIKey

  AIProviderCredentialHeaders = Cadenya::Models::AIProviderCredentialHeaders

  AIProviderKey = Cadenya::Models::AIProviderKey

  AIProviderKeyCreateParams = Cadenya::Models::AIProviderKeyCreateParams

  AIProviderKeyDeleteParams = Cadenya::Models::AIProviderKeyDeleteParams

  AIProviderKeyListParams = Cadenya::Models::AIProviderKeyListParams

  AIProviderKeyRetrieveParams = Cadenya::Models::AIProviderKeyRetrieveParams

  AIProviderKeySpec = Cadenya::Models::AIProviderKeySpec

  AIProviderKeyUpdateParams = Cadenya::Models::AIProviderKeyUpdateParams

  APIKey = Cadenya::Models::APIKey

  APIKeyCreateParams = Cadenya::Models::APIKeyCreateParams

  APIKeyDeleteParams = Cadenya::Models::APIKeyDeleteParams

  APIKeyDisableParams = Cadenya::Models::APIKeyDisableParams

  APIKeyEnableParams = Cadenya::Models::APIKeyEnableParams

  APIKeyInfo = Cadenya::Models::APIKeyInfo

  APIKeyListParams = Cadenya::Models::APIKeyListParams

  APIKeyRetrieveParams = Cadenya::Models::APIKeyRetrieveParams

  APIKeyRotateParams = Cadenya::Models::APIKeyRotateParams

  APIKeySpec = Cadenya::Models::APIKeySpec

  APIKeyUpdateParams = Cadenya::Models::APIKeyUpdateParams

  ApprovalRequirementFilter = Cadenya::Models::ApprovalRequirementFilter

  ApprovalRequirementFilterAlways = Cadenya::Models::ApprovalRequirementFilterAlways

  ApprovalRequirementFilterOnly = Cadenya::Models::ApprovalRequirementFilterOnly

  AssistantMessage = Cadenya::Models::AssistantMessage

  AssistantToolCall = Cadenya::Models::AssistantToolCall

  AttributeFilter = Cadenya::Models::AttributeFilter

  BareMetadata = Cadenya::Models::BareMetadata

  CallableTool = Cadenya::Models::CallableTool

  CallableToolAgent = Cadenya::Models::CallableToolAgent

  CallableToolCadenyaProvidedTool = Cadenya::Models::CallableToolCadenyaProvidedTool

  CallableToolTool = Cadenya::Models::CallableToolTool

  ContextLengths = Cadenya::Models::ContextLengths

  ContextWindowCompacted = Cadenya::Models::ContextWindowCompacted

  CreateOperationMetadata = Cadenya::Models::CreateOperationMetadata

  CreateResourceMetadata = Cadenya::Models::CreateResourceMetadata

  GlobalAPIKeyDisableParams = Cadenya::Models::GlobalAPIKeyDisableParams

  GlobalAPIKeyEnableParams = Cadenya::Models::GlobalAPIKeyEnableParams

  GlobalAPIKeyRetrieveParams = Cadenya::Models::GlobalAPIKeyRetrieveParams

  GlobalAPIKeyRotateParams = Cadenya::Models::GlobalAPIKeyRotateParams

  MemoryLayer = Cadenya::Models::MemoryLayer

  MemoryLayerCreateParams = Cadenya::Models::MemoryLayerCreateParams

  MemoryLayerDeleteParams = Cadenya::Models::MemoryLayerDeleteParams

  MemoryLayerInfo = Cadenya::Models::MemoryLayerInfo

  MemoryLayerListParams = Cadenya::Models::MemoryLayerListParams

  MemoryLayerRetrieveParams = Cadenya::Models::MemoryLayerRetrieveParams

  MemoryLayers = Cadenya::Models::MemoryLayers

  MemoryLayerSpec = Cadenya::Models::MemoryLayerSpec

  MemoryLayerUpdateParams = Cadenya::Models::MemoryLayerUpdateParams

  MemoryRead = Cadenya::Models::MemoryRead

  MemoryReference = Cadenya::Models::MemoryReference

  Model = Cadenya::Models::Model

  ModelDisableParams = Cadenya::Models::ModelDisableParams

  ModelEnableParams = Cadenya::Models::ModelEnableParams

  ModelListParams = Cadenya::Models::ModelListParams

  ModelRetrieveParams = Cadenya::Models::ModelRetrieveParams

  ModelSpec = Cadenya::Models::ModelSpec

  ModelSwapParams = Cadenya::Models::ModelSwapParams

  Objective = Cadenya::Models::Objective

  ObjectiveCancelParams = Cadenya::Models::ObjectiveCancelParams

  ObjectiveCompactParams = Cadenya::Models::ObjectiveCompactParams

  ObjectiveConfigSnapshot = Cadenya::Models::ObjectiveConfigSnapshot

  ObjectiveContextWindow = Cadenya::Models::ObjectiveContextWindow

  ObjectiveContextWindowData = Cadenya::Models::ObjectiveContextWindowData

  ObjectiveContinueParams = Cadenya::Models::ObjectiveContinueParams

  ObjectiveCreateParams = Cadenya::Models::ObjectiveCreateParams

  ObjectiveDiagnostics = Cadenya::Models::ObjectiveDiagnostics

  ObjectiveError = Cadenya::Models::ObjectiveError

  ObjectiveEvent = Cadenya::Models::ObjectiveEvent

  ObjectiveEventData = Cadenya::Models::ObjectiveEventData

  ObjectiveEventDataAssistantMessage = Cadenya::Models::ObjectiveEventDataAssistantMessage

  ObjectiveEventDataCancelled = Cadenya::Models::ObjectiveEventDataCancelled

  ObjectiveEventDataContextWindowCompacted = Cadenya::Models::ObjectiveEventDataContextWindowCompacted

  ObjectiveEventDataError = Cadenya::Models::ObjectiveEventDataError

  ObjectiveEventDataFinalized = Cadenya::Models::ObjectiveEventDataFinalized

  ObjectiveEventDataMemoryRead = Cadenya::Models::ObjectiveEventDataMemoryRead

  ObjectiveEventDataNotice = Cadenya::Models::ObjectiveEventDataNotice

  ObjectiveEventDataSubAgentSpawned = Cadenya::Models::ObjectiveEventDataSubAgentSpawned

  ObjectiveEventDataSubAgentUpdated = Cadenya::Models::ObjectiveEventDataSubAgentUpdated

  ObjectiveEventDataTimedOut = Cadenya::Models::ObjectiveEventDataTimedOut

  ObjectiveEventDataToolApprovalRequested = Cadenya::Models::ObjectiveEventDataToolApprovalRequested

  ObjectiveEventDataToolApproved = Cadenya::Models::ObjectiveEventDataToolApproved

  ObjectiveEventDataToolCalled = Cadenya::Models::ObjectiveEventDataToolCalled

  ObjectiveEventDataToolDenied = Cadenya::Models::ObjectiveEventDataToolDenied

  ObjectiveEventDataToolError = Cadenya::Models::ObjectiveEventDataToolError

  ObjectiveEventDataToolResult = Cadenya::Models::ObjectiveEventDataToolResult

  ObjectiveEventDataUserMessage = Cadenya::Models::ObjectiveEventDataUserMessage

  ObjectiveEventInfo = Cadenya::Models::ObjectiveEventInfo

  ObjectiveEventWebhookData = Cadenya::Models::ObjectiveEventWebhookData

  ObjectiveInfo = Cadenya::Models::ObjectiveInfo

  ObjectiveListContextWindowsParams = Cadenya::Models::ObjectiveListContextWindowsParams

  ObjectiveListEventsParams = Cadenya::Models::ObjectiveListEventsParams

  ObjectiveListParams = Cadenya::Models::ObjectiveListParams

  ObjectiveRetrieveDiagnosticsParams = Cadenya::Models::ObjectiveRetrieveDiagnosticsParams

  ObjectiveRetrieveParams = Cadenya::Models::ObjectiveRetrieveParams

  Objectives = Cadenya::Models::Objectives

  ObjectiveSecret = Cadenya::Models::ObjectiveSecret

  ObjectiveStreamEventsParams = Cadenya::Models::ObjectiveStreamEventsParams

  OperationMetadata = Cadenya::Models::OperationMetadata

  Page = Cadenya::Models::Page

  Profile = Cadenya::Models::Profile

  ProfileSpec = Cadenya::Models::ProfileSpec

  ProfileWhoamiParams = Cadenya::Models::ProfileWhoamiParams

  ResourceMetadata = Cadenya::Models::ResourceMetadata

  RotateChallengeTokenResponse = Cadenya::Models::RotateChallengeTokenResponse

  RotateWebhookSigningKeyResponse = Cadenya::Models::RotateWebhookSigningKeyResponse

  SearchSearchToolsOrToolSetsParams = Cadenya::Models::SearchSearchToolsOrToolSetsParams

  StringMatcher = Cadenya::Models::StringMatcher

  StringMatcherContains = Cadenya::Models::StringMatcherContains

  StringMatcherEndsWith = Cadenya::Models::StringMatcherEndsWith

  StringMatcherExact = Cadenya::Models::StringMatcherExact

  StringMatcherRegex = Cadenya::Models::StringMatcherRegex

  StringMatcherStartsWith = Cadenya::Models::StringMatcherStartsWith

  SubAgentSpawned = Cadenya::Models::SubAgentSpawned

  SubAgentUpdated = Cadenya::Models::SubAgentUpdated

  SyncCompleted = Cadenya::Models::SyncCompleted

  SyncFailed = Cadenya::Models::SyncFailed

  SyncStarted = Cadenya::Models::SyncStarted

  ToolApprovalRequested = Cadenya::Models::ToolApprovalRequested

  ToolApproved = Cadenya::Models::ToolApproved

  ToolCalled = Cadenya::Models::ToolCalled

  ToolDenied = Cadenya::Models::ToolDenied

  ToolError = Cadenya::Models::ToolError

  ToolFilter = Cadenya::Models::ToolFilter

  ToolResult = Cadenya::Models::ToolResult

  ToolSet = Cadenya::Models::ToolSet

  ToolSetAdapter = Cadenya::Models::ToolSetAdapter

  ToolSetAdapterBare = Cadenya::Models::ToolSetAdapterBare

  ToolSetAdapterBareVariant = Cadenya::Models::ToolSetAdapterBareVariant

  ToolSetAdapterHTTP = Cadenya::Models::ToolSetAdapterHTTP

  ToolSetAdapterHTTPVariant = Cadenya::Models::ToolSetAdapterHTTPVariant

  ToolSetAdapterMCP = Cadenya::Models::ToolSetAdapterMCP

  ToolSetAdapterMCPVariant = Cadenya::Models::ToolSetAdapterMCPVariant

  ToolSetAdapterOpenAPI = Cadenya::Models::ToolSetAdapterOpenAPI

  ToolSetAdapterOpenAPIUploadID = Cadenya::Models::ToolSetAdapterOpenAPIUploadID

  ToolSetAdapterOpenAPIURL = Cadenya::Models::ToolSetAdapterOpenAPIURL

  ToolSetAdapterOpenAPIVariant = Cadenya::Models::ToolSetAdapterOpenAPIVariant

  ToolSetArchiveParams = Cadenya::Models::ToolSetArchiveParams

  ToolSetCreateParams = Cadenya::Models::ToolSetCreateParams

  ToolSetDeleteParams = Cadenya::Models::ToolSetDeleteParams

  ToolSetEvent = Cadenya::Models::ToolSetEvent

  ToolSetEventData = Cadenya::Models::ToolSetEventData

  ToolSetEventDataSyncCompleted = Cadenya::Models::ToolSetEventDataSyncCompleted

  ToolSetEventDataSyncFailed = Cadenya::Models::ToolSetEventDataSyncFailed

  ToolSetEventDataSyncStarted = Cadenya::Models::ToolSetEventDataSyncStarted

  ToolSetGetOpenAPISpecParams = Cadenya::Models::ToolSetGetOpenAPISpecParams

  ToolSetInfo = Cadenya::Models::ToolSetInfo

  ToolSetListEventsParams = Cadenya::Models::ToolSetListEventsParams

  ToolSetListParams = Cadenya::Models::ToolSetListParams

  ToolSetRetrieveParams = Cadenya::Models::ToolSetRetrieveParams

  ToolSets = Cadenya::Models::ToolSets

  ToolSetSpec = Cadenya::Models::ToolSetSpec

  ToolSetUnarchiveParams = Cadenya::Models::ToolSetUnarchiveParams

  ToolSetUpdateParams = Cadenya::Models::ToolSetUpdateParams

  UnsafeUnwrapWebhookEvent = Cadenya::Models::UnsafeUnwrapWebhookEvent

  UnwrapWebhookEvent = Cadenya::Models::UnwrapWebhookEvent

  UpdateResourceMetadata = Cadenya::Models::UpdateResourceMetadata

  Upload = Cadenya::Models::Upload

  UploadCreateParams = Cadenya::Models::UploadCreateParams

  UploadInfo = Cadenya::Models::UploadInfo

  UploadRetrieveParams = Cadenya::Models::UploadRetrieveParams

  UploadSpec = Cadenya::Models::UploadSpec

  UserMessage = Cadenya::Models::UserMessage

  WebhookUnsafeUnwrapParams = Cadenya::Models::WebhookUnsafeUnwrapParams

  WebhookUnwrapParams = Cadenya::Models::WebhookUnwrapParams

  Workspace = Cadenya::Models::Workspace

  WorkspaceAdmin = Cadenya::Models::WorkspaceAdmin

  WorkspaceAdminArchiveParams = Cadenya::Models::WorkspaceAdminArchiveParams

  WorkspaceAdminCreateParams = Cadenya::Models::WorkspaceAdminCreateParams

  WorkspaceAdminListParams = Cadenya::Models::WorkspaceAdminListParams

  WorkspaceAdminRetrieveParams = Cadenya::Models::WorkspaceAdminRetrieveParams

  WorkspaceAdminUpdateParams = Cadenya::Models::WorkspaceAdminUpdateParams

  WorkspaceListParams = Cadenya::Models::WorkspaceListParams

  WorkspaceMember = Cadenya::Models::WorkspaceMember

  WorkspaceSecret = Cadenya::Models::WorkspaceSecret

  WorkspaceSecretCreateParams = Cadenya::Models::WorkspaceSecretCreateParams

  WorkspaceSecretDeleteParams = Cadenya::Models::WorkspaceSecretDeleteParams

  WorkspaceSecretInfo = Cadenya::Models::WorkspaceSecretInfo

  WorkspaceSecretListParams = Cadenya::Models::WorkspaceSecretListParams

  WorkspaceSecretRetrieveParams = Cadenya::Models::WorkspaceSecretRetrieveParams

  WorkspaceSecretSpec = Cadenya::Models::WorkspaceSecretSpec

  WorkspaceSecretUpdateParams = Cadenya::Models::WorkspaceSecretUpdateParams

  WorkspaceSpec = Cadenya::Models::WorkspaceSpec
end
