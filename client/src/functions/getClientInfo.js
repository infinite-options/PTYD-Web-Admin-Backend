export async function getIp () {
  const res = await fetch("https://api.ipify.org/?format=json");
  const api = await res.json();
  return api;
}

export function getBrowser () {
  // Get the user-agent string 
  let userAgentString =  
      navigator.userAgent; 

  // Detect Chrome 
  let chromeAgent =  
      userAgentString.indexOf("Chrome") > -1; 

  // Detect Internet Explorer 
  let IExplorerAgent =  
      userAgentString.indexOf("MSIE") > -1 ||  
      userAgentString.indexOf("rv:") > -1; 

  // Detect Firefox 
  let firefoxAgent =  
      userAgentString.indexOf("Firefox") > -1; 

  // Detect Safari 
  let safariAgent =  
      userAgentString.indexOf("Safari") > -1; 
        
  // Discard Safari since it also matches Chrome 
  if ((chromeAgent) && (safariAgent))  
      safariAgent = false; 

  // Detect Opera 
  let operaAgent =  
      userAgentString.indexOf("OP") > -1; 
        
  // Discard Chrome since it also matches Opera      
  if ((chromeAgent) && (operaAgent))  
      chromeAgent = false; 

  let response = {};

  if (chromeAgent) {
    response.browser_type = 'Chrome';
  }
  else if (firefoxAgent) {
    response.browser_type = 'Firefox';
  }
  else if (safariAgent) {
    response.browser_type = 'Safari';
  }
  //  Putting IE check before Firefox will return IE
  //  This is a bug that needs to be fixed
  else if (IExplorerAgent) {
    response.browser_type = 'Internet Explorer';
  }
  else if (operaAgent) {
    response.browser_type = 'Opera';
  }
  else {
    response.browser_type = 'Other';
  }

  return response;
}
