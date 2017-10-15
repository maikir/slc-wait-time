require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I am logged in as a tutor$/ do |word|
  pending
end

Given /^I am on the student line page$/ do |word|
  pending
end

Then /^I should see a list of students$/ do |word|
  pending
end

When /^I edit student "(.*)"$/ do |word|
  pending
end

Then /^I should see "(.*)"$/ do |word|
  pending
end