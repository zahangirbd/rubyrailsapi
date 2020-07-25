class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def execute_sql_statement(sql)
    #ActiveSupport::Logger
    logger.debug "execute_sql_statement: input sql is #{sql}"
    results = ActiveRecord::Base.connection.execute(sql)

    if results.present?
      return results
    else
      return nil
    end
  end

end
