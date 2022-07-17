auto check v2rayweb to get the free traffic 

# depends package selenium, nuget in vscode 


# run before check your  chrome verion Google Chrome 99.0.4844.84 
dotnet ex.dll


---
```
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.DevTools;
using OpenQA.Selenium.DevTools.V96.Page;
using Network = OpenQA.Selenium.DevTools.V96.Network;
using DevToolsSessionDomains = OpenQA.Selenium.DevTools.V96.DevToolsSessionDomains;


IDevTools devTools = driver as IDevTools;
            DevToolsSession session = devTools.GetDevToolsSession();
            var domains = session.GetVersionSpecificDomains<DevToolsSessionDomains>();
            domains.Page.Enable(new OpenQA.Selenium.DevTools.V96.Page.EnableCommandSettings());
domains.Page.AddScriptToEvaluateOnNewDocument(new AddScriptToEvaluateOnNewDocumentCommandSettings()
        {
            Source = "Object.defineProperty(navigator, 'webdriver', { get: () => undefined })"
        });
```
