Feature: Check language
  In order to test the selected language is right
  As a cosmopolitan developer
  I want to make sure the right words are present in the header

  Scenario: English pages
    When I visit the "English" homepage
    Then the header should have the words 'Prism is a tool'

  Scenario: French pages
    When I visit the "French" homepage
    Then the header should have the words 'Prism est un ensemble'

  Scenario: Spanish pages
    When I visit the "Spanish" homepage
    Then the header should have the words 'Prism es un conjunto'

  Scenario: German pages
    When I visit the "German" homepage
    Then the header should have the words 'Prism ist ein Satz'
