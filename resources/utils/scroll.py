  
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium import webdriver
#fazer alterações para compreender melhor as importações
def scroll_to_iframe(iframe_selector):
  iframe_element = driver.find_element(By.CSS_SELECTOR, iframe_selector)
  action_chains = ActionChains(driver)
  action_chains.scroll_to_element(iframe_element).perform()