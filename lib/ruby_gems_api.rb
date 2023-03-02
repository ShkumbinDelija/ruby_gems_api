require 'dry-struct'
require 'json'
require 'net/http'

module RubyGemsApi
end

module Types
  include Dry.Types()
end
class RubyGemsApi::Gem < Dry::Struct
  attribute :name, Types::String
  attribute :downloads, Types::Integer
  attribute :version, Types::String
  attribute :version_downloads, Types::Integer
  attribute :authors, Types::String
  attribute :info, Types::String
  attribute :project_uri, Types::String
  attribute :gem_uri, Types::String
  attribute :homepage_uri, Types::String
  attribute :wiki_uri, Types::String
  attribute :documentation_uri, Types::String
  attribute :mailing_list_uri, Types::String
  attribute :bug_tracker_uri, Types::String
  attribute :dependencies, Types::Hash
end




f = Net::HTTP.get_response(URI('https://rubygems.org/api/v1/gems/rails.json'))
p RubyGemsApi::Gem.new(JSON(f.body).transform_keys(&:to_sym))

