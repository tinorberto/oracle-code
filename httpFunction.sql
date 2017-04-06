declare

 req utl_http.req;
  res utl_http.resp;
  url varchar2(4000) := 'http://geocoder.pbh.gov.br/geocoder/v1/address?logradouro=afonso pena';
  name varchar2(4000);
  buffer varchar2(4000); 
  content varchar2(4000) := '{"room":"q", "partySize":"q"}';


begin

 req := utl_http.begin_request(url, 'GET',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0'); 
  utl_http.set_header(req, 'content-type', 'application/json'); 
  --utl_http.set_header(req, 'Content-Length', length(content));
 
  utl_http.write_text(req, content);
  res := utl_http.get_response(req);
  -- process the response from the HTTP call
  begin
    loop
      utl_http.read_line(res, buffer);
      dbms_output.put_line(buffer);
    end loop;
    utl_http.end_response(res);
  exception
    when utl_http.end_of_body 
    then
      utl_http.end_response(res);
  end;


end;