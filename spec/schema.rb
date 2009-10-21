ActiveRecord::Schema.define(:version => 20090319115628) do
  create_table "bottles", :force => true do |t|
    t.string  "name"
    t.integer "capacity"
  end
end