drop table if exists auditoria_operaciones ;
create table if not exists auditoria_operaciones (
operacion_id int not null,
importe_precio int,
Primary key ( operacion_id ))
;

drop trigger Trg_operaciones

delimiter //
create trigger Trg_operaciones 
after insert on operaciones
for each row
insert into auditoria_operaciones 
(operacion_id, tipo_op, precio, fecha , user_, hora )
values (new.operacion_id, new.tipo_op, new.precio, current_date, current_user , now() );
delimiter //
auditoria_operaciones

DROP TRIGGER Trg_operaciones_delete;

create trigger Trg_operaciones_delete
after delete on operaciones
for each row
insert into auditoria_operaciones 
(operacion_id, tipo_op, precio, fecha , user_, hora )
values (old.operacion_id, old.tipo_op, old.precio, current_date, current_user , now() );
delimiter //




delete from operaciones
where OPERACION_ID = 22;

insert into operaciones (tipo_op, precio, cantidad, accion_id)
values ('venta', 123 , 1233, 2);

insert into (id_level , id_class) values (1, 999)


select * from auditoria_operaciones;
where OPERACION_ID = 22;