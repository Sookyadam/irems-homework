CREATE USER company_readonly WITH PASSWORD 'Strong123!';

GRANT USAGE ON SCHEMA public TO company_readonly;
GRANT SELECT ON TABLE public.employees TO company_readonly;