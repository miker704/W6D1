# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  select DISTINCT yr
  from nobels
  where yr not in (
    select yr
    from nobels
    where subject = 'Chemistry'
  ) And subject = 'Physics';
  SQL
end
