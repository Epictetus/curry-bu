require 'mail'
class EmailValidator < ActiveModel::EachValidator
  # http://memo.yomukaku.net/entries/166
  def validate_each(record, attribute, value)
    begin
      m = Mail::Address.new(value)
      r = m.domain && m.address == value

      t = m.__send__(:tree)
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e
      r = false
    end
    record.errors[attribute] << (options[:message] || "is invalid") unless r
    #record.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.invalid')) unless r
  end
end
