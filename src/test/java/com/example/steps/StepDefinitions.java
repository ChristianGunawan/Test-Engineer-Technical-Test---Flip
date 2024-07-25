package com.example.steps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import utils.CustomWebDriverManager;

import java.time.Duration;

public class StepDefinitions {
    WebDriver driver = CustomWebDriverManager.getDriver();

    @Given("Go To Sample Web Form")
    public void goToSampleWebForm() {
        driver.get("https://flip-sample-form.onrender.com/");
    }

    @When("User Choose Title as {string}")
    public void userChooseTitleAs(String title) {
        WebElement titleDropdown = driver.findElement(By.id("title"));
        titleDropdown.click();
        String xpathExpression = String.format("//option[@value='%s']", title);
        driver.findElement(By.xpath(xpathExpression)).click();
    }

    @And("First Name as {string}")
    public void firstNameAs(String firstname) {
        WebElement firstName = driver.findElement(By.id("firstName"));
        firstName.sendKeys(firstname);
    }

    @And("Middle Name as {string}")
    public void middleNameAs(String middlename) {
        WebElement middleName = driver.findElement(By.id("middleName"));
        middleName.sendKeys(middlename);
    }

    @And("Last Name as {string}")
    public void lastNameAs(String lastname) {
        WebElement lastName = driver.findElement(By.id("lastName"));
        lastName.sendKeys(lastname);
    }

    @And("Email as {string}")
    public void emailAs(String email) {
        WebElement Email = driver.findElement(By.id("email"));
        Email.sendKeys(email);
    }

    @And("Phone Number as {string}")
    public void phoneNumberAs(String phone) {
        WebElement Phone = driver.findElement(By.id("phone"));
        Phone.sendKeys(phone);
    }

    @And("Date of Birth as {string}")
    public void dateOfBirthAs(String birth) {
        WebElement DOB = driver.findElement(By.id("dob"));
        DOB.sendKeys(birth);
    }

    @And("Gender is Male")
    public void genderIsMale() {
        //blank
    }

    @And("Address Provence is DKI Jakarta")
    public void addressProvenceIsDKIJakarta() {
        WebElement provence = driver.findElement(By.id("province"));
        provence.click();
        WebElement Jakarta = driver.findElement(By.xpath("//option[@value='DKI Jakarta']"));
        Jakarta.click();
    }

    @And("Address City is Jakarta Barat")
    public void addressCityIsJakartaBarat() throws InterruptedException {
        Thread.sleep(5000);
        WebElement city = driver.findElement(By.id("city"));
        city.click();
        WebElement JakartaBarat = driver.findElement(By.xpath("//option[@value='Jakarta Barat']"));
        JakartaBarat.click();
    }

    @And("Click Submit Form")
    public void clickSubmitForm() {
        WebElement submit = driver.findElement(By.name("action"));
        submit.click();
    }

    @Then("Verify User Information popup")
    public void verifyUserInformationPopup() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[contains(text(), 'Please wait')]")));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[contains(text(), 'Close')]")));
    }

    @Then("Verify Error Message {string}")
    public void verifyErrorMessage(String error) {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        String xpathExpression = String.format("//*[contains(text(), '%s')]", error);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpathExpression)));
    }
}
