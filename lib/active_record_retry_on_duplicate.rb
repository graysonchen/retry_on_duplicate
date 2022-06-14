require "active_record_retry_on_duplicate/version"

module ActiveRecordRetryOnDuplicate
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def retry_on_duplicate
      retried = false
      begin
        yield
      rescue *retry_on_duplicate_rescue_messages => err
        if retry_on_duplicate_on_retry?(err, retried)
          retried = true
          retry
        else
          raise err
        end
      end
    end

    private

    def retry_on_duplicate_rescue_messages
      @retry_on_duplicate_rescue_messages ||=
        [ ActiveRecord::RecordNotUnique ] | extra_retry_on_duplicate_rescue_messages
    end

    def extra_retry_on_duplicate_rescue_messages
      arr = []
      arr << PG::UniqueViolation if defined?(PG::UniqueViolation)
      arr << Mysql2::Error if defined?(Mysql2::Error)
      arr
    end

    def retry_on_duplicate_on_retry?(err, retried)
      !retried &&
        (err.message.include?("Duplicate entry") ||
          err.message.include?("PG::UniqueViolation") ||
          err.message.include?("has already been taken"))
    end
  end
end
