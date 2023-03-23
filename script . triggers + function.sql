select * from fondo_comun_de_inversionoperaciones
select * from auditoria_operaciones

create or replace view Clientes_alta_renta as (select cliente_id, saldo_invertido from clientes 
order by saldo_invertido desc limit 5 );

create or replace view Operaciones_importantes as
 (select tipo_op , Precio , cantidad, accion_id, cliente_id, criptomoneda_id, fci_id , divisa_id from operaciones 
order by precio * cantidad desc limit 5 );
DELIMITER //

DELIMITER //

delimiter $$	
create  function fn_descontar_comision ( p_cliente_id int ,   p_comision float)
returns int
DETERMINISTIC	
BEGIN

	declare v_resultado int ;
    set v_resultado = 
		(select distinct saldo_invertido * ( 100 - p_comision) as resultado 
        from clientes where CLIENTE_id = p_cliente_id ) ;
        
	return v_resultado ;
    
 
END $$

select fn_descontar_comision (1, (0.01));


        
        
delimiter $$	

--Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
