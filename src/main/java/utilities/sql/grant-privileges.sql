grant select, insert, update, delete 
	on `betme`.* to 'user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `betme`.* to 'admin'@'%';
