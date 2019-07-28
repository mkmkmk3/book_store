# frozen_string_literal: true

Redis.current = Redis.new(host: 'redis', port: 6379)
