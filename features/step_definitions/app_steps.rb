require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I am logged in as a tutor$/ do
  pending
end

Given /^I am on the student line page$/ do
  pending
end

Then /^I should see a list of students$/ do
  pending
end

When /^I edit student "(.*)"$/ do |word|
  pending
end

Then /^I should see "(.*)"$/ do |word|
  pending
end

When /^I fill in "(.*)" and "(.*)" times with "(.*)" and "(.*)"$/ do |word|
  pending
end

Then /^I should see "start" filled with "0" and end filled with "0"$/ do |word|
  pending
end

Given /^there are no students$/ do |word|
  pending
end

Given /^a student is on the home page$/ do
  pending
end

Given /^the student clicks sign in$/ do
  pending
end

Given /^I am on the wait time page$/ do
  pending
end

Then /^I should be on the sign up form$/ do
  pending
end

Then /^I should not be on the sign up form$/ do
  pending
end

When /^I fill out information$/ do
  pending
end

When /^I click on "(.*)"$/ do |word|
  pending
end

Given /^I am on the sign up form$/ do
  pending
end

Then /^I should see a wait time$/ do
  pending
end
