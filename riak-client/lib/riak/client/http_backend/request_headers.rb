# Copyright 2010 Sean Cribbs, Sonian Inc., and Basho Technologies, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'riak/util/headers'

module Riak
  class Client
    class HTTPBackend
      # @private
      class RequestHeaders < Riak::Util::Headers
        alias each each_capitalized

        def initialize(hash)
          initialize_http_header(hash)
        end

        def to_a
          [].tap do |arr|
            each_capitalized do |k,v|
              arr << "#{k}: #{v}"
            end
          end
        end

        def to_hash
          {}.tap do |hash|
            each_capitalized do |k,v|
              hash[k] ||= []
              hash[k] << v
            end
          end
        end
      end
    end
  end
end
