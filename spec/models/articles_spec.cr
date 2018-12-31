require "./spec_helper"
require "../../src/models/articles.cr"

describe Articles do
  Spec.before_each do
    Articles.clear
  end
end
