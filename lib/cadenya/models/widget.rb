# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Widgets#create
    class Widget < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #   WidgetSpec is the user-provided configuration for a widget.
      #
      #   @return [Cadenya::Models::WidgetSpec]
      required :spec, -> { Cadenya::WidgetSpec }

      # @!attribute info
      #   WidgetInfo provides read-only server-derived data about a widget.
      #
      #   @return [Cadenya::Models::WidgetInfo, nil]
      optional :info, -> { Cadenya::WidgetInfo }

      response_only do
        # @!attribute state
        #   The current lifecycle state of the widget. Output only. Widgets are created
        #   STATE_ACTIVE; use the :archive and :unarchive actions to transition between
        #   states.
        #
        #   @return [Symbol, Cadenya::Models::Widget::State]
        required :state, enum: -> { Cadenya::Widget::State }
      end

      # @!method initialize(metadata:, spec:, state:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::Widget}
      #   for more details.
      #
      #   Widget is an embeddable chat surface bound to a single agent. Each widget owns a
      #   globally unique, immutable DNS label under the widgets domain (e.g.
      #   "k7m2xq9fp4wn.widgets.cadenya.com"): one widget = one hostname = one origin
      #   allowlist = one agent binding. Browsers talk to the widget host with session
      #   bearer tokens minted server-side via WidgetSessionService.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::WidgetSpec] WidgetSpec is the user-provided configuration for a widget.
      #
      #   @param state [Symbol, Cadenya::Models::Widget::State] The current lifecycle state of the widget. Output only. Widgets are
      #
      #   @param info [Cadenya::Models::WidgetInfo] WidgetInfo provides read-only server-derived data about a widget.

      # The current lifecycle state of the widget. Output only. Widgets are created
      # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
      # states.
      #
      # @see Cadenya::Models::Widget#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ACTIVE = :STATE_ACTIVE
        STATE_ARCHIVED = :STATE_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
