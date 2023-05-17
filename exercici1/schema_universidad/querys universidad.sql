select persona.apellido1, persona.apellido2, persona.nombre from persona where persona.tipo = 'alumno' order by persona.apellido1;
select persona.apellido1, persona.apellido2, persona.nombre from persona where persona.tipo = 'alumno' and persona.telefono is null;
select persona.apellido1, persona.apellido2, persona.nombre from persona where year(persona.fecha_nacimiento) = 1999;
select persona.apellido1, persona.apellido2, persona.nombre from persona where persona.nif like '%K' and persona.tipo = 'profesor'and persona.telefono is null;
select asignatura.nombre from asignatura where asignatura.cuatrimestre = 1 and asignatura.curso = 3 and asignatura.id_grado = 7;
select persona.apellido1 as 1r_cognom, persona.apellido2 as 2n_cognom, persona.nombre as nom, departamento.nombre as departament from persona inner join profesor on persona.id = profesor.id_profesor inner join departamento on profesor.id_departamento = departamento.id where tipo = 'profesor' order by persona.apellido1 asc, persona.apellido2 asc, persona.nombre asc;
select asignatura.nombre, curso_escolar.anyo_inicio as inici, curso_escolar.anyo_fin as fin from asignatura inner join alumno_se_matricula_asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura inner join persona on persona.id = alumno_se_matricula_asignatura.id_alumno inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id where persona.nif ='26902806M';
select distinct departamento.nombre from departamento join profesor on profesor.id_departamento = departamento.id join asignatura on asignatura.id_profesor = profesor.id_profesor join grado on asignatura.id_grado = grado.id where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
select distinct persona.nombre as nombre, persona.apellido1 as 1apellido, persona.apellido2 as 2apellido, curso_escolar.anyo_inicio from persona join alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id where tipo = 'alumno' and curso_escolar.anyo_inicio like "%2018%";

select departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre from profesor left join persona on persona.id = profesor.id_profesor left join departamento on profesor.id_departamento = departamento.id order by departamento.nombre asc, persona.apellido1 asc, persona.apellido2 asc, persona.nombre asc;
select persona.apellido1, persona.apellido2, persona.nombre from departamento left join profesor on profesor.id_departamento = departamento.id right join persona on persona.id = profesor.id_profesor where profesor.id_departamento is null;
select departamento.nombre from departamento left join profesor on profesor.id_departamento = departamento.id where profesor.id_departamento is null;
select persona.apellido1, persona.apellido2, persona.nombre from profesor left join asignatura on asignatura.id_profesor = profesor.id_profesor left join persona on persona.id = profesor.id_profesor where asignatura.id_profesor is null;
select asignatura.nombre from asignatura where id_profesor is null;
select distinct departamento.nombre from departamento left join profesor on (departamento.id = profesor.id_departamento) left join asignatura on (profesor.id_profesor = asignatura.id) left join alumno_se_matricula_asignatura on (asignatura.id = alumno_se_matricula_asignatura.id_asignatura) left join curso_escolar on (alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id) where curso_escolar.id is null; 




select count(persona.id) as "Total d'alumnes" from persona where persona.tipo = "alumno";
select count(persona.id) as "Total d'alumnes" from persona where persona.tipo = "alumno" and persona.fecha_nacimiento like "%1999%";
select departamento.nombre, count(profesor.id_profesor) as "Nombre de professors" from departamento inner join profesor on departamento.id = profesor.id_departamento group by departamento.id;
select departamento.nombre, count(profesor.id_profesor) as "nombre de professors" from departamento left join profesor on departamento.id = profesor.id_departamento group by departamento.id;
select grado.nombre as "nom", count(asignatura.id) as "nombre d'assignatures" from grado left join asignatura on grado.id = asignatura.id_grado group by grado.nombre order by "nombre d'assignatures" desc;
select grado.nombre as "nom", count(asignatura.id) as "nombre d'assignatures" from grado left join asignatura on grado.id = asignatura.id_grado group by grado.nombre having count(asignatura.id)>40;
select grado.nombre as "nom del grau", asignatura.tipo as "tipus d'assignatura", sum(asignatura.creditos) as "suma dels crèdits" from grado join asignatura on grado.id = asignatura.id_grado group by grado.nombre, asignatura.tipo;
select curso_escolar.anyo_inicio as "any d'inici del curs escolar", count(distinct alumno_se_matricula_asignatura.id_alumno) as "nombre d'alumnes matriculats" from curso_escolar left join  alumno_se_matricula_asignatura on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar group by curso_escolar.id;
select profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id_profesor) as "nombre d'assignatures" from profesor left join asignatura using (id_profesor) left join persona on profesor.id_profesor = persona.id group by profesor.id_profesor order by count(asignatura.id) desc;
select * from persona where tipo = 'alumno' and fecha_nacimiento = (select max(fecha_nacimiento) from persona where tipo = 'alumno' and fecha_nacimiento is not null);
select profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id_profesor) as "nombre d'assignatures" from profesor left join asignatura using (id_profesor) left join persona on profesor.id_profesor = persona.id group by profesor.id_profesor order by count(asignatura.id) desc;
select persona.apellido1, persona.apellido2, persona.nombre from profesor join departamento on profesor.id_departamento = departamento.id join persona on profesor.id_profesor = persona.id left join asignatura on asignatura.id_profesor = profesor.id_profesor group by persona.apellido1, persona.apellido2, persona.nombre having count(asignatura.id) = 0;