var headers = {
  'Content-Type': 'application/json',
  'Ocp-Apim-Subscription-Key': '{{subscription-key}}'
};
var request = http.Request('POST', Uri.parse('https://api.biopassid.com/multibiometrics/face_detect'));
request.body = json.encode({
  "Check": {
    "Image": "{{base64}}"
  }
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
