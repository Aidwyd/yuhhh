#################################################################################################################
# Imports
from email.mime import base
import json
from os import system
import os
import random
import string
import sys
from telnetlib import EC
from time import sleep
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as ec
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import TimeoutException
import urllib.request
from urllib.request import Request, urlopen
from fake_useragent import UserAgent

#################################################################################################################
# Variables
baseUsername = "semk_"
accPassword = "4ever4life"
accAmount = "5"

# User agents
useragents = [
    "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246",
    "user-agent=Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36",
    "user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9",
    "user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9"
]

# Chromedriver setup
PATH = "C:\chromedriver.exe"

# Remove error recognition
errordone = False

# Just in case:
# Changing window size
sys.stdout.write("\x1b[8;{rows};{cols}t".format(rows=30, cols=100))

#################################################################################################################
# Functions
def randomword(length):
   letters = string.ascii_letters + string.digits
   return ''.join(random.choice(letters) for i in range(length))

def generate():
    #################################################################################################################
    # Generate function

    print("Username base?   --  This will set how the bot accounts will be named. Example: botaccount")
    baseUsername = input("Value:")
    print("Password?        --  This will set the password for all generated accounts. Example: rblxBOTpw69")
    accPassword = input("Value:")
    print("Amount?          --  How many accounts should be generated?")
    accAmount = input("Value:")
    print(" ")
    print("Thanks! Generating will start now.")
    sleep(1)

    # Writing to output log file
    sendmessage = "==================================================\n\nStarted session with base username " + baseUsername + "\n\n"
    file1 = open('rblxaltgen-output.txt', 'a')
    file1.write(sendmessage)
    file1.close()

    inco = False

    for x in range(int(accAmount)):

        errordone = False

        # This is were we start opening windows

        _ = system('cls')
        print("====================================================================================================")
        randomUsername = baseUsername + randomword(5)
        print("Generated username: " + randomUsername)

        options = webdriver.ChromeOptions()
        options.add_argument("--window-size=600,1000")

        ua = UserAgent()
        user_agent = ua.random
        print('Selected User Agent: ' + user_agent)
        options.add_argument('user-agent=' + user_agent)

        driver = webdriver.Chrome(PATH, options=options)
        wait = WebDriverWait(driver, 30)
        driver.get("https://roblox.com")
        sleep(0.1)

        print("Launched " + driver.title)
        print("Disabling cookies...")

        try:
            declinecookies = WebDriverWait(driver, 1, 0.1).until(ec.visibility_of_element_located((By.CLASS_NAME, "btn-secondary-lg cookie-btn btn-primary-md btn-min-width")))
            declinecookies.click()
            print("Cookies disabled")
        except TimeoutException:
            print("Cookie message didn't appear, ignoring it")

        print("Searching inputs...")

        username = wait.until(ec.visibility_of_element_located((By.ID, "signup-username")))
        print("signup-username found")
        password = wait.until(ec.visibility_of_element_located((By.ID, "signup-password")))
        print("signup-password found")
        daymenu = wait.until(ec.visibility_of_element_located((By.ID, "DayDropdown")))
        print("DayDropdown found")
        monthmenu = wait.until(ec.visibility_of_element_located((By.ID, "MonthDropdown")))
        print("MonthDropdown found")
        yearmenu = wait.until(ec.visibility_of_element_located((By.ID, "YearDropdown")))
        print("YearDropdown found")
        register = wait.until(ec.visibility_of_element_located((By.ID, "signup-button")))
        print("signup-button found")

        print("Inputs found")
        print("Filling birth date...")

        sleep(0.1)
        daymenu.click()

        for x in range(6):
            daymenu.send_keys(Keys.ARROW_DOWN)
        daymenu.send_keys(Keys.RETURN)

        sleep(0.1)
        monthmenu.click()

        for x in range(9):
            monthmenu.send_keys(Keys.ARROW_DOWN)
        monthmenu.send_keys(Keys.RETURN)

        sleep(0.1)
        yearmenu.click()

        for x in range(19):
            yearmenu.send_keys(Keys.ARROW_DOWN)
        yearmenu.send_keys(Keys.RETURN)

        print("Birth date filled")
        print("Filling username...")

        sleep(0.1)
        username.send_keys(randomUsername)
        username.send_keys(Keys.RETURN)

        print("Username filled")
        print("Filling password...")

        sleep(0.1)
        password.send_keys(accPassword)
        password.send_keys(Keys.RETURN)

        print("Password filled")
        print("Registering...")

        sleep(0.1)
        register.click()

        print("Registered")
        print("Press enter if you solved the verification (if there was no verification, press enter too)")

        randomassvalueidkjusttodosomeshitbruh = input("Waiting for input...")

        try:
            searchbar = WebDriverWait(driver, 10).until(ec.visibility_of_element_located((By.ID, "navbar-search-input")))

            print("Human verification solved")
            print("Home page loaded")
            print("Saving account...")

            sendmessage = "Generated " + randomUsername + ":" + accPassword + " successfully\n"
            file1 = open('rblxaltgen-output.txt', 'a')
            file1.write(sendmessage)
            file1.close()

            sendmessage = randomUsername + ":" + accPassword + "\n"
            file2 = open('rblxaltgen-output-raw.txt', 'a')
            file2.write(sendmessage)
            file2.close()

            print("Saved account")
            #print("Logging out...")

            #settingsicon = WebDriverWait(driver, 5).until(ec.visibility_of_element_located((By.ID, "nav-settings")))
            #settingsicon.click()
            #logout = WebDriverWait(driver, 5).until(ec.visibility_of_element_located((By.CLASS_NAME, "rbx-menu-item logout-menu-item")))
            #logout.click()
            #try:
                #ignore = WebDriverWait(driver, 2).until(ec.visibility_of_element_located((By.CLASS_NAME, "change-email-button")))
                #print("Security window triggered, bypassing...")
                #ignore.click()
                #print("Security window bypassed")
            #except:
                #print("No security window triggered")
            #loginfield = WebDriverWait(driver, 5).until(ec.visibility_of_element_located((By.ID, "login-username")))

            #print("Logged out")
            print("Closing window...")

            driver.quit()

            print("Window closed")

            sleep(0.5)

            del(driver)
            del(wait)
        except TimeoutException:
            print("Human verification was not solved")

    sendmessage = "\nFinished session of " + str(accAmount) + " accounts\n\n"
    file1 = open('rblxaltgen-output.txt', 'a')
    file1.write(sendmessage)
    file1.close()

    print("====================================================================================================")
    print("Generated accounts!")
    print("Logins saved to rblxaltgen-output.txt & rblxaltgen-output-raw.txt")
    print("Returning to menu in 5 seconds...")

    sleep(5)

def simplelogin():
    print("test")

# User interface
while True:
    _ = system('cls')
    print("====================================================================================================")
    print("                                                                                                    ")
    print("                                  RblxAltGen by The_Semikon43#6969                                  ")
    print("                                                                                                    ")
    print("                          Generate Roblox bot accounts and control them!                            ")
    print("                                                                                                    ")
    print("====================================================================================================")
    print("                                                                                                    ")
    print(" [1] Account Generator")
    print(" [2] Alt Manager")
    print(" [3] Exit")

    userinput = input("Value:")

    if userinput == "1":
        _ = system('cls')
        print("Generator loaded!")
        generate()

    if userinput == "2":
        _ = system('cls')
        print("Login loaded!")
        simplelogin()
        
    if userinput == "3":
        sys.exit("You exited the program.")