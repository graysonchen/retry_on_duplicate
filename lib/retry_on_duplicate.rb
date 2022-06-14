require "active_support/lazy_load_hooks"
require "active_record_retry_on_duplicate"

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send :include, ActiveRecordRetryOnDuplicate
end
