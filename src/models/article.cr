class Article < Granite::Base
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

  before_save :pre_save_article

  # TODO: implement
  private def pre_save_article
    self.html ||= markdown
    self.plain_text ||= markdown
    self.published_at = Time.now if is_public
  end
end
