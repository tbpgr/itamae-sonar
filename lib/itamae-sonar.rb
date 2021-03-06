# encoding: utf-8
require 'gems'
require 'date'
require 'gems/configuration'
require 'gems/request'
require 'json'

# open class for paging
module Gems
  class Client
    include Gems::Request
    def search_with_page(query, page)
      response = get('/api/v1/search.json', :query => query, :page => page.to_s)
      JSON.parse(response)
    end
  end
end

module ItamaeSonar
  module_function

  RUBOTY_SEARCH_CONDITION = 'itamae-'

  def self.info(gem_name)
    gem_info = Gems.info(gem_name)
    {
      name: gem_info['name'],
      desc: gem_info['info'],
      downloads: gem_info['downloads'],
      rubygems_uri: gem_info['project_uri'],
      homepage_uri: gem_info['homepage_uri']
    }
  end

  def self.search(query)
    results = []
    page = 1
    loop {
      ret = Gems.search_with_page(query, page)
      break if ret.empty?
      results += ret
      page += 1
    }
    results
  end

  def self.random
    gem_info = search(RUBOTY_SEARCH_CONDITION).sample
    {
      name: gem_info['name'],
      desc: gem_info['info'],
      downloads: gem_info['downloads'],
      rubygems_uri: gem_info['project_uri'],
      homepage_uri: gem_info['homepage_uri']
    }
  end

  def self.ranking(limit = 5)
    search(RUBOTY_SEARCH_CONDITION)
        .map { |e|
          {
            name: e['name'],
            downloads: e['downloads'].to_i,
            authors: e['authors']
          }
        }.sort_by { |e|-e[:downloads] }
        .take(limit)
  end

  def self.author_ranking(limit = 5)
    search(RUBOTY_SEARCH_CONDITION)
        .map { |e|{ authors: e['authors'], downloads: e['downloads'] } }
        .group_by { |e| e[:authors] }
        .map { |key, values|
          {
            authors: key,
            downloads: values.reduce(0) { |a, e|a + e[:downloads] }
          }
        }.sort_by { |e| -e[:downloads] }
        .take(limit)
  end
end
