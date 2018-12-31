class Articles < Granite::Base
  adapter pg
  table_name articles

  primary id : Int64
  field title : String
  field markdown : String
  field html : String
  field plain_text : String
  field is_public : Bool
  field published_at : Time
  field url : String
  timestamps
end
