Feature: Weather forecast of Jakarta Selatan

  Scenario: Fetch 5 Day / 3 Hour Forecast of Jakarta Selatan
    Given url 'https://api.openweathermap.org/data/2.5/forecast'
    And param lat = '-6.28381815'
    And param lon = '106.80486324917382'
    And param appid = '7b3032432385c5b1204e50b35042b5a1'
    And param units = 'metric'
    When method GET
    Then status 200
    And print response
    #Validate
    And match response.city.name == 'Rawa Barat'
    And match response.city.coord.lat == -6.2838
    And match response.city.coord.lon == 106.8049
    And match response.city.country == 'ID'
    #Validate not null
    And match response.list[*].dt != null
    And match response.list[*].main.temp != null
    And match response.list[*].main.temp_min != null
    And match response.list[*].main.temp_max != null
    And match response.list[*].main.pressure != null
    And match response.list[*].main.humidity != null
    And match response.list[*].weather[*].id != null
    And match response.list[*].weather[*].main != null
    And match response.list[*].weather[*].description != null
    And match response.list[*].weather[*].icon != null
    And match response.list[*].clouds.all != null
    And match response.list[*].wind.speed != null
    And match response.list[*].wind.deg != null
    And match response.list[*].visibility != null
    And match response.list[*].dt_txt != null


  Scenario: Fetch Air Pollution of Jakarta Selatan
    Given url 'https://api.openweathermap.org/data/2.5/air_pollution'
    And param lat = '-6.28381815'
    And param lon = '106.80486324917382'
    And param appid = '7b3032432385c5b1204e50b35042b5a1'
    And param units = 'metric'
    When method GET
    Then status 200
    And print response
    #Validate
    And match response.coord.lon == 106.8049
    And match response.coord.lat == -6.2838
    #Validate not null
    And match response.list[*].main.aqi != null
    And match response.list[*].components.co != null
    And match response.list[*].components.no != null
    And match response.list[*].components.no2 != null
    And match response.list[*].components.o3 != null
    And match response.list[*].components.so2 != null
    And match response.list[*].components.pm2_5 != null
    And match response.list[*].components.pm10 != null
    And match response.list[*].components.nh3 != null
    And match response.list[*].dt != null