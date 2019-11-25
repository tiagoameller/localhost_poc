# localhost_poc
Delphi PoC or how to access to localhost from a https website.<br>
This PoC shows how to call an action inside a Delphi local executable behind a firewall.

## How to run
1. Find poc.exe in Win32\Release
2. Dll libraries and certs folder must be present in order to run poc.exe

## How to install root certificate in client
In Windows, go to Control Panel, Internet settings, Content, certificate. Add ROOT certificate and select `M01B_root_CA.crt`

## JS code to inject in any https web page to test PoC
Copy this script:
```javascript
<script>
document.addEventListener("DOMContentLoaded", function () {
 var url = 'https://127.0.0.1:5000';

 $('body').click(function () {
   $.get(url, function (data, status) {
     alert(`Response from localhost: "${data}" with status: "${status}"`);
   });
 });
});
</script>
```
to your page. It can be done in developer tools or in actual served page.

## Test it all
1. run poc.exe locally. First time Windows will ask to create a *local* firewall exception. Please, permit that.
2. **in same computer**, go to injected page and click in any blank section.
3. an alert should raise and poc.exe should add a line to ListBox on every click.

## Go further
Modify this code to do more interesting things:
* manage USB connected hardware
* print from a web page tickets
* ...
