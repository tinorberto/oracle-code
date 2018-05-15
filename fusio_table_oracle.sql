create or replace
procedure publish_cinema_event
( p_room_id in varchar2
, p_party_size in number
) is
  req utl_http.req;
  res utl_http.resp;
  url varchar2(4000) := 'http://localhost:9002/cinema';
  name varchar2(4000);
  buffer varchar2(4000); 
  content varchar2(4000) := '{"room":"'||p_room_id||'", "partySize":"'||p_party_Size||'"}';
 
begin
  req := utl_http.begin_request(url, 'POST',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0'); 
  utl_http.set_header(req, 'content-type', 'application/json'); 
  utl_http.set_header(req, 'Content-Length', length(content));
 
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
end publish_cinema_event;


begin
  
p_room_id in varchar2 , p_party_size in number

  publish_cinema_event('2', -4);
  publish_cinema_event('1', 4);
  publish_cinema_event('3', -1);
end;




declare
  p_room_id  varchar2(1024); 
  p_party_size  number;
  req utl_http.req;
  res utl_http.resp;
  url varchar2(4000) := 'https://www.googleapis.com/fusiontables/v1/table';
  name varchar2(4000);
  buffer varchar2(4000); 
  content varchar2(4000) := '{"room":"'||p_room_id||'", "partySize":"'||p_party_Size||'"}';
begin 
    req := utl_http.begin_request(url, 'POST',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0'); 
  utl_http.set_header(req, 'content-type', 'application/json'); 
  utl_http.set_header(req, 'Content-Length', length(content));
  

  
end;
