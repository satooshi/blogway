require "../spec_helper"

def article_hash
  {"title" => "Fake", "markdown" => "Fake", "is_public" => "true", "published_at" => "2018-12-31 11:05:49 +09:00", "url" => "Fake"}
end

def article_params
  params = [] of String
  params << "title=#{article_hash["title"]}"
  params << "markdown=#{article_hash["markdown"]}"
  params << "is_public=#{article_hash["is_public"]}"
  params << "url=#{article_hash["url"]}"
  params.join("&")
end

def create_article
  model = Article.new(article_hash)
  model.save
  model
end

module Admin
  class ArticleControllerTest < GarnetSpec::Controller::Test
    getter handler : Amber::Pipe::Pipeline

    def initialize
      @handler = Amber::Pipe::Pipeline.new
      @handler.build :web do
        plug Amber::Pipe::Error.new
        plug Amber::Pipe::Session.new
        plug Amber::Pipe::Flash.new
      end
      @handler.prepare_pipelines
    end
  end

  describe ArticleControllerTest do
    subject = ArticleControllerTest.new

    it "renders article index template" do
      Article.clear
      response = subject.get "/admin/articles"

      response.status_code.should eq(200)
      response.body.should contain("articles")
    end

    it "renders article show template" do
      Article.clear
      model = create_article
      location = "/admin/articles/#{model.id}"

      response = subject.get location

      response.status_code.should eq(200)
      response.body.should contain("Show Article")
    end

    it "renders article new template" do
      Article.clear
      location = "/admin/articles/new"

      response = subject.get location

      response.status_code.should eq(200)
      response.body.should contain("New Article")
    end

    it "renders article edit template" do
      Article.clear
      model = create_article
      location = "/admin/articles/#{model.id}/edit"

      response = subject.get location

      response.status_code.should eq(200)
      response.body.should contain("Edit Article")
    end

    it "creates a article" do
      Article.clear
      response = subject.post "/admin/articles", body: article_params

      response.headers["Location"].should eq "/admin/articles"
      response.status_code.should eq(302)
      response.body.should eq "302"
    end

    it "updates a article" do
      Article.clear
      model = create_article
      response = subject.patch "/admin/articles/#{model.id}", body: article_params

      response.headers["Location"].should eq "/admin/articles"
      response.status_code.should eq(302)
      response.body.should eq "302"
    end

    it "deletes a article" do
      Article.clear
      model = create_article
      response = subject.delete "/admin/articles/#{model.id}"

      response.headers["Location"].should eq "/admin/articles"
      response.status_code.should eq(302)
      response.body.should eq "302"
    end
  end
end
