class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.present? && value.match?(/\A[a-z0-9._+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/)

    record.errors[attribute] << (options[:message] || 'is not an email')
  end
end
