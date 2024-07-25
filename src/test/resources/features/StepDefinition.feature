Feature: Submit Form

  #FTE-1
  Scenario Outline: Valid Submit
    Given Go To Sample Web Form
    When User Choose Title as "<title>"
    And First Name as "<firstname>"
    And Middle Name as "<middlename>"
    And Last Name as "<lastname>"
    And Email as "<email>"
    And Phone Number as "<phone>"
    And Date of Birth as "<date>"
    And Gender is Male
    And Address Provence is DKI Jakarta
    And Address City is Jakarta Barat
    And Click Submit Form
    Then Verify User Information popup

    Examples:
      | title | firstname | middlename | lastname | email             | phone       | date     |
      | Mr.   | Christian | Angka      | Gunawan  | gunawan@gmail.com | 08123456789 | 02042000 |

      #FTE-6
  Scenario Outline: Invalid Submit Form - Not fill Middle Name
    Given Go To Sample Web Form
    When User Choose Title as "<title>"
    And First Name as "<firstname>"
    And Middle Name as "<middlename>"
    And Last Name as "<lastname>"
    And Email as "<email>"
    And Phone Number as "<phone>"
    And Date of Birth as "<date>"
    And Gender is Male
    And Address Provence is DKI Jakarta
    And Address City is Jakarta Barat
    And Click Submit Form
    Then Verify Error Message "<errormessage>"

    Examples:
      | title | firstname | middlename | lastname | email             | phone       | date     | errormessage            |
      | Mr.   | Christian |            | Gunawan  | gunawan@gmail.com | 08123456789 | 02042000 | Middle name is required |

          #FTE-7
  Scenario Outline: Invalid Submit Form - Not fill Title
    Given Go To Sample Web Form
    When First Name as "<firstname>"
    And Middle Name as "<middlename>"
    And Last Name as "<lastname>"
    And Email as "<email>"
    And Phone Number as "<phone>"
    And Date of Birth as "<date>"
    And Gender is Male
    And Address Provence is DKI Jakarta
    And Address City is Jakarta Barat
    And Click Submit Form
    Then Verify User Information popup

    Examples:
      |  | firstname | middlename | lastname | email             | phone       | date     |  |
      |  | Christian | Angka      | Gunawan  | gunawan@gmail.com | 08123456789 | 02042000 |  |

      #FTE-8
  Scenario Outline: Invalid Submit Form - Fill phone number less than 10 digits
    Given Go To Sample Web Form
    When User Choose Title as "<title>"
    And First Name as "<firstname>"
    And Middle Name as "<middlename>"
    And Last Name as "<lastname>"
    And Email as "<email>"
    And Phone Number as "<phone>"
    And Date of Birth as "<date>"
    And Gender is Male
    And Address Provence is DKI Jakarta
    And Address City is Jakarta Barat
    And Click Submit Form
    Then Verify Error Message "<errormessage>"

    Examples:
      | title | firstname | middlename | lastname | email             | phone   | date     | errormessage                      |
      | Mr.   | Christian | Angka      | Gunawan  | gunawan@gmail.com | 1234567 | 02042000 | Phone number must be 10-12 digits |

          #FTE-9
  Scenario Outline: Invalid Submit Form - Fill with invalid format email
    Given Go To Sample Web Form
    When User Choose Title as "<title>"
    And First Name as "<firstname>"
    And Middle Name as "<middlename>"
    And Last Name as "<lastname>"
    And Email as "<email>"
    And Phone Number as "<phone>"
    And Date of Birth as "<date>"
    And Gender is Male
    And Address Provence is DKI Jakarta
    And Address City is Jakarta Barat
    And Click Submit Form
    Then Verify Error Message "<errormessage>"

    Examples:
      | title | firstname | middlename | lastname | email             | phone   | date     | errormessage                      |
      | Mr.   | Christian | Angka      | Gunawan  | gunawan@gmail.com | 1234567 | 02042000 | Phone number must be 10-12 digits |