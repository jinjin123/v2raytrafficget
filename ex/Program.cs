using System.Threading;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.Events;
using System;
using System.Configuration;
using System.Collections.Specialized;
namespace SocksWebTrafficGet
{
    public class Get
    {
 
        public static void  Main(string[] args)
        {
            ChromeOptions options = new ChromeOptions();
            //chrome crash
            options.AddArgument("--headless");
            options.AddArgument("--no-sandbox");
            options.AddArgument("--disable-dev-shm-usage");
            options.AddArgument(ConfigurationManager.AppSettings.Get("proxy"));

            var driver = new ChromeDriver(options);
            
            //driver.Navigate().GoToUrl("https://jlpt.neea.edu.cn/index.do");
            driver.Navigate().GoToUrl("https://gsoust.xyz/auth/login");
            
            driver.FindElement(By.Id("email")).SendKeys(ConfigurationManager.AppSettings.Get("email"));
            driver.FindElement(By.Id("password")).SendKeys(ConfigurationManager.AppSettings.Get("pwd"));
            driver.FindElement(By.ClassName("login")).Click();
            Thread.Sleep(3000);

            if (driver.FindElement(By.CssSelector("#checkin-div > a")).GetAttribute("onclick") == "checkin()") {
                    driver.FindElement(By.CssSelector("#checkin-div > a")).Click();
            }
            driver.Quit();
        }
 
    }
}

