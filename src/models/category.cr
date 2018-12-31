class Category < Granite::Base
  adapter pg
  table_name categories

  primary id : Int64
  field name : String
  field url : String
  field parent_id : Int32
  field sort : Int32
  field description : String
  timestamps
end
