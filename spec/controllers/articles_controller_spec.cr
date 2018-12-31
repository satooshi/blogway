require "./spec_helper"

def articles_hash
  {"title" => "Fake", "markdown" => "Fake", "html" => "Fake", "plain_text" => "Fake", "is_public" => "true", "published_at" => "2018-12-31 09:45:10 +09:00", "url" => "Fake"}
end

def articles_params
  params = [] of String
  params << "title=#{articles_hash["title"]}"
  params << "markdown=#{articles_hash["markdown"]}"
  params << "html=#{articles_hash["html"]}"
  params << "plain_text=#{articles_hash["plain_text"]}"
  params << "is_public=#{articles_hash["is_public"]}"
  params << "published_at=#{articles_hash["published_at"]}"
  params << "url=#{articles_hash["url"]}"
  params.join("&")
end

def create_articles
  model = Articles.new(articles_hash)
  model.save
  model
end

class ArticlesControllerTest < GarnetSpec::Controller::Test
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

describe ArticlesControllerTest do
  subject = ArticlesControllerTest.new

  it "renders articles index template" do
    Articles.clear
    response = subject.get "/articles"

    response.status_code.should eq(200)
    response.body.should contain("articles")
  end

  it "renders articles show template" do
    Articles.clear
    model = create_articles
    location = "/articles/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Articles")
  end

  it "renders articles new template" do
    Articles.clear
    location = "/articles/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Articles")
  end

  it "renders articles edit template" do
    Articles.clear
    model = create_articles
    location = "/articles/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Articles")
  end

  it "creates a articles" do
    Articles.clear
    response = subject.post "/articles", body: articles_params

    response.headers["Location"].should eq "/articles"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a articles" do
    Articles.clear
    model = create_articles
    response = subject.patch "/articles/#{model.id}", body: articles_params

    response.headers["Location"].should eq "/articles"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a articles" do
    Articles.clear
    model = create_articles
    response = subject.delete "/articles/#{model.id}"

    response.headers["Location"].should eq "/articles"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
