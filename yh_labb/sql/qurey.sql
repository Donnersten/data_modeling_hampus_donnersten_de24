
set search_path to yrkesco;


--Vilka Program YrkesCo har i Göteborg
select p.programnamn, s2.skolnamn
from yrkesco.program p
inner join yrkesco.skolprogram s on p.program_id = s.program_id 
inner join yrkesco.skola s2 on s.skol_id = s2.skol_id 
where s2.skolnamn = 'YrkesCo Göteborg';

-- Program Data Engineer i Stockholm och vilka kurser som programmet innerhåller samt vem som håller i kuresn och yrkestiteln. 
select p.programnamn, k2.kursnamn, p2.förnamn || ' '|| p2.efternamn as Personal, y.titel 
from yrkesco.program p
inner join yrkesco.kursprogram k on p.program_id = k.program_id
inner join yrkesco.kurs k2 on k.kurskod = k2.kurskod
inner join yrkesco.kurstillfälle k3 on k2.kurskod = k3.kurskod
inner join yrkesco.personal p2 on k3.personal_id = p2.personal_id
inner join yrkesco.yrkesroll y on p2.yrkes_id = y.yrkes_id
inner join yrkesco.skolpersonal sp on p2.personal_id = sp.personal_id
inner join yrkesco.skola s on sp.skol_id = s.skol_id
where p.programnamn = 'Data engineer' and s.skolnamn = 'YrkesCo Stockholm';

-- Utbildningsledare som ansvarar för Data Engineer klassen i stockholm
SELECT bo.program_id || bo.år as klass, p.förnamn ||' '|| p.efternamn as Utbildningsledare, s.skolnamn
FROM personal p
inner join klass kl on p.personal_id = kl.personal_id
inner join yrkesroll y on p.yrkes_id = y.yrkes_id
inner join beviljade_omgångar bo on kl.bo_id = bo.bo_id
inner join skola s on kl.skol_id = s.skol_id 
inner join "program" p2 on bo.program_id = p2.program_id 
where y.yrkes_id = 1 and bo.år = '24' and bo.program_id = 'DE' and s.skolnamn = 'YrkesCo Stockholm';

-- Vilka som ingår i Ledningsgrupperna 
SELECT lg.program_id,sk.skolnamn ,p.förnamn as personal, y.titel, s.förnamn as student, f.företag_namn, f.representant
from ledningsgrupp lg
inner join ledningspersonal lp on lg.ledningsgrupp_id = lp.ledningsgrupp_id
inner join personal p on lp.personal_id = p.personal_id
inner join ledningstudent ls on lg.ledningsgrupp_id = ls.ledningsgrupp_id
inner join student s on ls.student_id = s.student_id
inner join yrkesroll y on p.yrkes_id = y.yrkes_id
inner join skola sk on lg.skol_id = sk.skol_id
inner join ledningsföretag lf on lg.ledningsgrupp_id = lf.ledningsgrupp_id
inner join företag f on lf.företag_org_nummer = f.företag_org_nummer
order by lg.program_id;


-- Vilka Studenter som bor på vilka adresser med deras personnummer
select s.förnamn, s.efternamn, pu.personnummer ,a.gatuadress, st.stad
from student s
inner join person_uppgifter pu on s.pu_id = pu.pu_id
inner join adress a on  pu.adress_id = a.adress_id
inner join stad st on a.stad_id = st.stad_id;





