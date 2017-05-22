
-- checar qualidade do index
begin
   dbms_output.put_line('SX_TRECHO');
   sdo_tune.analyze_rtree('SISTEMA_VIARIO', 'SX_TRECHO');
   dbms_output.put_line('');
   dbms_output.put_line('SX_BAIRRO_POPULAR');
   sdo_tune.analyze_rtree('CADASTRO_TECNICO', 'SX_BAIRRO_POPULAR');
end;