global class ProjectCalloutServiceMockInvalid implements HttpCalloutMock
{
	global HTTPResponse respond(HTTPRequest request) 
    {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(400);
        response.setStatus('Bad Request');
        response.setBody('Bad Request');
        
        return response;
    }
}