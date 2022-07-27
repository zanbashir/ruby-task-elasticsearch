require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new log: true, transport_option: { request: { timeout: 5 } }
