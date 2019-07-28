# frozen_string_literal: true

# セッションのストレージにRedisを利用
Rails.application.config.session_store :redis_store,
                                       servers: {
                                         host: 'redis',
                                         port: 6379,
                                         db: 0,
                                         namespace: '_sessions'
                                       },
                                       key: "_#{Rails.application.class.parent_name.downcase}_session",
                                       expire_after: 1.week
