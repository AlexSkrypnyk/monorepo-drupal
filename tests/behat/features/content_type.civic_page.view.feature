@civic @civic_cards @civic_page
Feature: View of Page content type

  Ensure that Page content can be viewed correctly.

  Background:
    Given managed file:
      | filename       | uri                                | path           |
      | test_image.jpg | public://civic_test/test_image.jpg | test_image.jpg |
      | test_svg.svg   | public://civic_test/test_svg.svg   | test_svg.svg   |

    And "civic_image" media:
      | name               | field_c_m_image |
      | [TEST] Civic Image | test_image.jpg  |

    And "civic_page" content:
      | title                             | status |
      | [TEST] Page Promo cards test      | 1      |
      | [TEST] Page Navigation cards test | 1      |
      | [TEST] Page Event cards test      | 1      |
      | [TEST] Page Subject cards test    | 1      |
      | [TEST] Page Service cards test    | 1      |
      | [TEST] Page Tasks cards test      | 1      |
      | [TEST] Page Reference cards test  | 1      |

    And "civic_event" content:
      | title                                  | status |
      | [TEST] Reference Page Event cards test | 1      |

  @api
  Scenario: Civic page content type page can be viewed by anonymous with promo cards
    Given I am an anonymous user
    And "field_c_n_components" in "civic_page" "node" with "title" of "[TEST] Page Promo cards test" has "civic_card_container" paragraph:
      | field_c_p_title        | [TEST] Promo card container                      |
      | field_c_p_column_count | 4                                                |
      | field_c_p_header_link  | 0: View all promo cards - 1: https://example.com |
      | field_c_p_fill_width   | 0                                                |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Promo card container" has "civic_card_promo" paragraph:
      | field_c_p_date    | 2021-04-30                            |
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text                          |
      | field_c_p_theme   | light                                 |
      | field_c_p_title   | Promo card title                      |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Promo card container" has "civic_card_promo" paragraph:
      | field_c_p_date    | 2021-04-30                            |
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text 2                        |
      | field_c_p_theme   | dark                                  |
      | field_c_p_title   | Promo card title 1                    |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Promo card container" has "civic_card_promo" paragraph:
      | field_c_p_date    | 2021-04-30                            |
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text 3                        |
      | field_c_p_theme   | dark                                  |
      | field_c_p_title   | Promo card title 2                    |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Promo card container" has "civic_card_promo" paragraph:
      | field_c_p_date    | 2021-04-30                            |
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text 3                        |
      | field_c_p_theme   | dark                                  |
      | field_c_p_title   | Promo card title 3                    |

    When I visit "civic_page" "[TEST] Page Promo cards test"
    And I should see the text "[TEST] Promo card container"
    Then I should see the link "View all promo cards" with "https://example.com" in 'div.civic-card-container'
    And I should see an "div.civic-promo-card" element
    And I should see the text "Promo card title"
    And I should see the text "Promo card title 1"
    And I should see the text "Promo card title 2"
    And I should see the text "Promo card title 3"

  @api
  Scenario: Civic page content type page can be viewed by anonymous with Navigation cards
    Given I am an anonymous user
    And "field_c_n_components" in "civic_page" "node" with "title" of "[TEST] Page Navigation cards test" has "civic_card_container" paragraph:
      | field_c_p_title        | [TEST] Navigation card container                      |
      | field_c_p_column_count | 4                                                     |
      | field_c_p_header_link  | 0: View all navigation cards - 1: https://example.com |
      | field_c_p_fill_width   | 0                                                     |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Navigation card container" has "civic_card_navigation" paragraph:
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text                          |
      | field_c_p_theme   | light                                 |
      | field_c_p_title   | Navigation card title                 |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Navigation card container" has "civic_card_navigation" paragraph:
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text 2                        |
      | field_c_p_theme   | dark                                  |
      | field_c_p_title   | Navigation card title 1               |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Navigation card container" has "civic_card_navigation" paragraph:
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text 3                        |
      | field_c_p_theme   | dark                                  |
      | field_c_p_title   | Navigation card title 2               |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Navigation card container" has "civic_card_navigation" paragraph:
      | field_c_p_image   | [TEST] Civic Image                    |
      | field_c_p_link    | 0: Test link - 1: https://example.com |
      | field_c_p_summary | Summary text 3                        |
      | field_c_p_theme   | dark                                  |
      | field_c_p_title   | Navigation card title 3               |

    When I visit "civic_page" "[TEST] Page Navigation cards test"
    And I should see the text "[TEST] Navigation card container"
    Then I should see the link "View all navigation cards" with "https://example.com" in 'div.civic-card-container'
    And I should see 4 "div.civic-navigation-card" elements
    And I should see 4 ".civic-navigation-card__title" elements
    And I should see 4 ".civic-navigation-card__summary" elements
    And I should see the text "Navigation card title"
    And I should see the text "Navigation card title 1"
    And I should see the text "Navigation card title 2"
    And I should see the text "Navigation card title 3"

  @api
  Scenario: Civic page content type page can be viewed by anonymous with Subject cards
    Given I am an anonymous user
    And "field_c_n_components" in "civic_page" "node" with "title" of "[TEST] Page Subject cards test" has "civic_card_container" paragraph:
      | field_c_p_title        | [TEST] Subject card container                      |
      | field_c_p_column_count | 3                                                  |
      | field_c_p_header_link  | 0: View all Subject cards - 1: https://example.com |
      | field_c_p_fill_width   | 0                                                  |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Subject card container" has "civic_card_subject" paragraph:
      | field_c_p_image | [TEST] Civic Image                    |
      | field_c_p_link  | 0: Test link - 1: https://example.com |
      | field_c_p_theme | light                                 |
      | field_c_p_title | Subject card title                    |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Subject card container" has "civic_card_subject" paragraph:
      | field_c_p_image | [TEST] Civic Image                    |
      | field_c_p_link  | 0: Test link - 1: https://example.com |
      | field_c_p_theme | dark                                  |
      | field_c_p_title | Subject card title 1                  |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Subject card container" has "civic_card_subject" paragraph:
      | field_c_p_link  | 0: Test link - 1: https://example.com |
      | field_c_p_theme | dark                                  |
      | field_c_p_title | Subject card title 2                  |

    When I visit "civic_page" "[TEST] Page Subject cards test"
    And I should see the text "[TEST] Subject card container"
    Then I should see the link "View all Subject cards" with "https://example.com" in 'div.civic-card-container'
    And I should see 1 "div.civic-card-container" elements
    And I should see 3 "div.civic-subject-card" elements
    And I should see 2 "div.civic-subject-card__image img" elements
    And I should see 3 "div.civic-subject-card__title" elements
    And I should not see an "div.civic-navigation-card" element
    And I should see the text "Subject card title"
    And I should see the text "Subject card title 1"
    And I should see the text "Subject card title 2"

  @api
  Scenario: Civic page content type page can be viewed by anonymous with Service cards
    Given I am an anonymous user
    And "field_c_n_components" in "civic_page" "node" with "title" of "[TEST] Page Service cards test" has "civic_card_container" paragraph:
      | field_c_p_title        | [TEST] Service card container                      |
      | field_c_p_column_count | 3                                                  |
      | field_c_p_header_link  | 0: View all Service cards - 1: https://example.com |
      | field_c_p_fill_width   | 0                                                  |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Service card container" has "civic_service_card" paragraph:
      | field_c_p_links | 0: Test link 1 - 1: https://example.com, 0: Test link 11 - 1: https://example.com |
      | field_c_p_theme | light                                                                             |
      | field_c_p_title | Service card title                                                                |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Service card container" has "civic_service_card" paragraph:
      | field_c_p_links | 0: Test link 2 - 1: https://example.com, 0: Test link 21 - 1: https://example.com |
      | field_c_p_theme | dark                                                                              |
      | field_c_p_title | Service card title 1                                                              |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Service card container" has "civic_service_card" paragraph:
      | field_c_p_links | 0: Test link 3 - 1: https://example.com, 0: Test link 31 - 1: https://example.com, 0: Test link 32 - 1: https://example.com, 0: Test link 33 - 1: https://example.com |
      | field_c_p_theme | dark                                                                                                                                                                  |
      | field_c_p_title | Service card title 2                                                                                                                                                  |

    When I visit "civic_page" "[TEST] Page Service cards test"
    And I should see the text "[TEST] Service card container"
    Then I should see the link "View all Service cards" with "https://example.com" in 'div.civic-card-container'
    And I should see 1 "div.civic-card-container" elements
    And I should see 3 "div.civic-service-card" elements
    And I should see 2 "div.civic-service-card.civic-theme-dark" elements
    And I should see 1 "div.civic-service-card.civic-theme-light" elements
    And I should see 3 "div.civic-service-card__title" elements
    And I should see 3 "ul.civic-service-card__links" elements
    And I should not see an "div.civic-subject-card" element
    And I should not see an "div.civic-service-card img" element
    And I should see the text "Service card title"
    And I should see the text "Service card title 1"
    And I should see the text "Service card title 2"

  @api
  Scenario: Civic page content type page can be viewed by anonymous with Tasks cards
    Given I am an anonymous user
    And "field_c_n_components" in "civic_page" "node" with "title" of "[TEST] Page Tasks cards test" has "civic_card_container" paragraph:
      | field_c_p_title        | [TEST] Tasks cards container |
      | field_c_p_column_count | 3                            |
      | field_c_p_fill_width   | 0                            |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Tasks cards container" has "civic_card_task" paragraph:
      | field_c_p_link    | 0: Test link 1 - 1: https://example.com/card1 |
      | field_c_p_title   | Card task title 1                             |
      | field_c_p_summary | Summary text 1                                |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Tasks cards container" has "civic_card_task" paragraph:
      | field_c_p_link    | 0: Test link 2 - 1: https://example.com/card2                                                     |
      | field_c_p_title   | Card task title 2                                                                                 |
      | field_c_p_summary | Quisque velit nisi, pretium ut lacinia in, elementum id enim. Nulla porttitor accumsan tincidunt. |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Tasks cards container" has "civic_card_task" paragraph:
      | field_c_p_link    | 0: Test link 3 - 1: https://example.com/card3 |
      | field_c_p_title   | Card task title 3                             |
      | field_c_p_summary | Summary text 3                                |

    When I visit "civic_page" "[TEST] Page Tasks cards test"
    And I should see the text "[TEST] Tasks cards container"
    And I should not see an "div.civic-card-container__link a" element
    And I should see 1 "div.civic-card-container" elements
    And I should see 3 "div.civic-navigation-card--small" elements
    And I should see 3 "div.civic-navigation-card__content" elements
    And I should see 3 "div.civic-navigation-card__title" elements
    And I should see 3 "div.civic-navigation-card__summary" elements
    And I should not see an "div.civic-subject-card" element
    Then I should see the link "Card task title 1" with "https://example.com/card1" in 'div.civic-navigation-card__title'
    Then I should see the link "Card task title 1" with "https://example.com/card1" in 'div.civic-navigation-card__title'
    Then I should see the link "Card task title 1" with "https://example.com/card1" in 'div.civic-navigation-card__title'
    And save screenshot

  @api
  Scenario: Civic page content type page can be viewed by anonymous with Reference cards
    Given I am an anonymous user
    And "field_c_n_components" in "civic_page" "node" with "title" of "[TEST] Page Reference cards test" has "civic_card_container" paragraph:
      | field_c_p_title        | [TEST] Reference cards container |
      | field_c_p_column_count | 3                                |
      | field_c_p_fill_width   | 0                                |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Reference cards container" has "civic_card_event_reference" paragraph:
      | field_c_p_reference | [TEST] Reference Page Event cards test |
      | field_c_p_theme     | light                                  |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Reference cards container" has "civic_card_subject_reference" paragraph:
      | field_c_p_reference | [TEST] Page Promo cards test |
      | field_c_p_theme     | light                        |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Reference cards container" has "civic_card_navigation_reference" paragraph:
      | field_c_p_reference | [TEST] Page Promo cards test |
      | field_c_p_theme     | dark                         |
    And "field_c_p_cards" in "civic_card_container" "paragraph" with "field_c_p_title" of "[TEST] Reference cards container" has "civic_card_reference_promo" paragraph:
      | field_c_p_reference | [TEST] Page Promo cards test |
      | field_c_p_theme     | light                        |

    When I visit "civic_page" "[TEST] Page Reference cards test"
    And I should see the text "[TEST] Reference cards container"
    And I should not see an "div.civic-card-container__link a" element
    And I should see 1 "div.civic-card-container" elements
    And I should see 1 "div.civic-event-card__content" elements
    And I should see 1 "div.civic-subject-card__title" elements
    And I should see 1 "div.civic-navigation-card__title" elements
    And I should see 1 "div.civic-promo-card__content" elements
    And I should see 3 "div.civic-card-container__card .civic-theme-light" elements
    And I should see 1 "div.civic-card-container__card .civic-theme-dark" elements
    And save screenshot
