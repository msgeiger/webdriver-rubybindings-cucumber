Feature: You should see a title bar and title description on each page

Scenario: Visit primary pages

    When I visit each marineby.com page
    Then I should see the title bar
    And I should see the title description 

