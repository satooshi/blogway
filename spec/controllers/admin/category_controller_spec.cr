require "../spec_helper"

def category_hash
  {"name" => "Fake", "url" => "Fake", "parent_id" => "1", "sort" => "1", "description" => "Fake"}
end

def category_params
  params = [] of String
  params << "name=#{category_hash["name"]}"
  params << "url=#{category_hash["url"]}"
  params << "parent_id=#{category_hash["parent_id"]}"
  params << "sort=#{category_hash["sort"]}"
  params << "description=#{category_hash["description"]}"
  params.join("&")
end

def create_category
  model = Category.new(category_hash)
  model.save
  model
end

module Admin
  class CategoryControllerTest < GarnetSpec::Controller::Test
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

  describe CategoryControllerTest do
    subject = CategoryControllerTest.new

    it "renders category index template" do
      Category.clear
      response = subject.get "/admin/categories"

      response.status_code.should eq(200)
      response.body.should contain("categories")
    end

    it "renders category show template" do
      Category.clear
      model = create_category
      location = "/admin/categories/#{model.id}"

      response = subject.get location

      response.status_code.should eq(200)
      response.body.should contain("Show Category")
    end

    it "renders category new template" do
      Category.clear
      location = "/admin/categories/new"

      response = subject.get location

      response.status_code.should eq(200)
      response.body.should contain("New Category")
    end

    it "renders category edit template" do
      Category.clear
      model = create_category
      location = "/admin/categories/#{model.id}/edit"

      response = subject.get location

      response.status_code.should eq(200)
      response.body.should contain("Edit Category")
    end

    it "creates a category" do
      Category.clear
      response = subject.post "/admin/categories", body: category_params

      response.headers["Location"].should eq "/admin/categories"
      response.status_code.should eq(302)
      response.body.should eq "302"
    end

    it "updates a category" do
      Category.clear
      model = create_category
      response = subject.patch "/admin/categories/#{model.id}", body: category_params

      response.headers["Location"].should eq "/admin/categories"
      response.status_code.should eq(302)
      response.body.should eq "302"
    end

    it "deletes a category" do
      Category.clear
      model = create_category
      response = subject.delete "/admin/categories/#{model.id}"

      response.headers["Location"].should eq "/admin/categories"
      response.status_code.should eq(302)
      response.body.should eq "302"
    end
  end
end
