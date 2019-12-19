
-- Quando tentei executar ocorreu o erro ORA-29273: falha na solicitação HTTP
set serveroutput on;
declare

 req utl_http.req;
  res utl_http.resp;
  url varchar2(4000) := 'http://admin:geoserver@10.0.57.85:8080/geoserver2/gwc/rest/seed/germem:CAIXA_PASSAGEM.json';
  name varchar2(4000);
  buffer varchar2(4000); 
  content varchar2(4000);


begin


-- -44,0503740339662 -19,9988872392446 -43,9095219667229 -19,808911296433
-- -44,0923297472811 -19,84164913311 -44,0864548962503 -19,8348883673221
 content := '{"seedRequest":{"name":"germem:CAIXA_PASSAGEM","bounds":{"coords":{ "double":[" -44.0923297472811","-19.84164913311"," -44.0864548962503","-19.8348883673221"]}},"srs":{"number":4326},"zoomStart":1,"zoomStop":21,"format":"image\/png","type":"reseed","threadCount":4}}';

  dbms_output.put_line(content);

 req := utl_http.begin_request(url, 'POST',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0'); 
  --utl_http.set_header(req, 'Authorization', 'Basic ' || utl_encode.base64_encode(utl_raw.cast_to_raw('admin:geoserver'))); 
 -- utl_http.set_header(req, 'content-type', 'text/xml'); 
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


end;