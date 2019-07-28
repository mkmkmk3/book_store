# 定義側
# app/jobs/example_job.rb
class ExampleJob < ApplicationJob
  # ジョブが実行されるキューを指定
  queue_as :default
  def perform(*args)
    # 非同期処理で実行したい処理を記載
   puts 'kitakita'
  end
end

