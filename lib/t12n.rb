# frozen_string_literal: true

require "zeitwerk"
require "ivo"

loader = Zeitwerk::Loader.for_gem
loader.setup

module T12n
  class Error < StandardError; end
  class ArgumentError < Error; end

  Attr = Ivo.new(:name, :serializer)
  Schema = Ivo.new(:name, :attrs, :context_blocks)

  extend self

  def start(schema_store: nil)
    schema_store ||= SchemaStore.new
    Interface.new(schema_store)
  end
end
