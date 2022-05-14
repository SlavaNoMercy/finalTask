@isTest
global class TestIncorrectHttpMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('"animals}}icken", "mighty moose"]}');
        response.setStatusCode(200);
        return response; 
    }
}
