--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 9.6.13

-- Started on 2019-06-10 11:12:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS zpsjlzbixfkzxt WITH SCHEMA pg_catalog;


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION zpsjlzbixfkzxt IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16394)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    matricula bigint NOT NULL,
    periodo character varying(255) NOT NULL,
    senha character varying(10) NOT NULL
);


ALTER TABLE public.aluno OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 186 (class 1259 OID 16400)
-- Name: aluno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aluno_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 186
-- Name: aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_id_seq OWNED BY public.aluno.id;


--
-- TOC entry 187 (class 1259 OID 16402)
-- Name: calendario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendario (
    id integer NOT NULL,
    informacoes character varying(255)
);


ALTER TABLE public.calendario OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 188 (class 1259 OID 16405)
-- Name: calendario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendario_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 188
-- Name: calendario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendario_id_seq OWNED BY public.calendario.id;


--
-- TOC entry 189 (class 1259 OID 16407)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento (
    id integer NOT NULL,
    tipo_documento character varying(255) NOT NULL,
    id_aluno integer NOT NULL,
    anexo character varying NOT NULL,
    CONSTRAINT ck_d_td CHECK (((tipo_documento)::text = ANY (ARRAY[('CARTA_DE_ACEITE'::character varying)::text, ('HISTORICO_ESCOLAR'::character varying)::text, ('FICHA_INSCRICAO'::character varying)::text])))
);


ALTER TABLE public.documento OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 190 (class 1259 OID 16414)
-- Name: documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 190
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documento_id_seq OWNED BY public.documento.id;


--
-- TOC entry 191 (class 1259 OID 16416)
-- Name: estado_avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_avaliacao (
    id integer NOT NULL,
    estado character varying(255)
);


ALTER TABLE public.estado_avaliacao OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 192 (class 1259 OID 16419)
-- Name: estado_avaliacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_avaliacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_avaliacao_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 192
-- Name: estado_avaliacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_avaliacao_id_seq OWNED BY public.estado_avaliacao.id;


--
-- TOC entry 193 (class 1259 OID 16421)
-- Name: instituicao_ensino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituicao_ensino (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.instituicao_ensino OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 194 (class 1259 OID 16424)
-- Name: instituicao_ensino_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instituicao_ensino_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instituicao_ensino_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 194
-- Name: instituicao_ensino_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instituicao_ensino_id_seq OWNED BY public.instituicao_ensino.id;


--
-- TOC entry 195 (class 1259 OID 16426)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id integer NOT NULL,
    tipo_perfil character varying(255),
    descricao_perfil character varying(255)
);


ALTER TABLE public.perfil OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 196 (class 1259 OID 16432)
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 196
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- TOC entry 197 (class 1259 OID 16434)
-- Name: pre_projeto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pre_projeto (
    id integer NOT NULL,
    tema character varying(255) NOT NULL,
    id_professor_avaliador2 integer,
    id_professor_avaliador1 integer,
    id_aluno1 integer NOT NULL,
    id_aluno2 integer,
    nota1 integer,
    nota2 integer,
    observacao1 character varying(255),
    observacao2 character varying(255),
    notafinal integer,
    estado_avaliacao character varying NOT NULL,
    anexo character varying,
    id_professor_orientador integer NOT NULL,
    id_professor_coorientador integer,
    observacao_aprovacao character varying,
    aprovado boolean DEFAULT false NOT NULL,
    CONSTRAINT ck_p_ea CHECK (((estado_avaliacao)::text = ANY (ARRAY[('CADASTRADO'::character varying)::text, ('EM_AVALIACAO'::character varying)::text, ('AVALIADO'::character varying)::text])))
);


ALTER TABLE public.pre_projeto OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 198 (class 1259 OID 16442)
-- Name: pre_projeto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pre_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pre_projeto_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 198
-- Name: pre_projeto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pre_projeto_id_seq OWNED BY public.pre_projeto.id;


--
-- TOC entry 199 (class 1259 OID 16444)
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    siape character varying(255) NOT NULL,
    lattes character varying(255) NOT NULL,
    area_pesquisa character varying(255) NOT NULL,
    escolaridade character varying(255) NOT NULL,
    senha character varying(10) NOT NULL,
    se_nde boolean DEFAULT false NOT NULL,
    perfil character varying(50) DEFAULT 'PROFESSOR'::character varying NOT NULL,
    id_instituicao integer,
    CONSTRAINT ck_p_pe CHECK (((perfil)::text = ANY (ARRAY[('PROFESSOR'::character varying)::text, ('COORDENADOR'::character varying)::text])))
);


ALTER TABLE public.professor OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 200 (class 1259 OID 16453)
-- Name: professor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.professor_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 200
-- Name: professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professor_id_seq OWNED BY public.professor.id;


--
-- TOC entry 201 (class 1259 OID 16455)
-- Name: relatorio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relatorio (
    id integer NOT NULL,
    id_tcc integer NOT NULL,
    orientacao character varying,
    data_orientacao date
);


ALTER TABLE public.relatorio OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 202 (class 1259 OID 16461)
-- Name: relatorio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relatorio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relatorio_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 202
-- Name: relatorio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relatorio_id_seq OWNED BY public.relatorio.id;


--
-- TOC entry 203 (class 1259 OID 16463)
-- Name: tcc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tcc (
    id integer NOT NULL,
    nota_tcc1 character varying(255),
    nota_tcc2 character varying(255),
    tema character varying(255) NOT NULL,
    id_professor_orientador integer NOT NULL,
    id_professor_coorientador integer,
    id_aluno integer NOT NULL,
    id_aluno2 integer,
    id_professor_membro1 integer,
    id_professor_membro2 integer
);


ALTER TABLE public.tcc OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 204 (class 1259 OID 16469)
-- Name: tcc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tcc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tcc_id_seq OWNER TO zpsjlzbixfkzxt;

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 204
-- Name: tcc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tcc_id_seq OWNED BY public.tcc.id;


--
-- TOC entry 2062 (class 2604 OID 16471)
-- Name: aluno id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN id SET DEFAULT nextval('public.aluno_id_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 16472)
-- Name: calendario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario ALTER COLUMN id SET DEFAULT nextval('public.calendario_id_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 16473)
-- Name: documento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento ALTER COLUMN id SET DEFAULT nextval('public.documento_id_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 16474)
-- Name: estado_avaliacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_avaliacao ALTER COLUMN id SET DEFAULT nextval('public.estado_avaliacao_id_seq'::regclass);


--
-- TOC entry 2067 (class 2604 OID 16475)
-- Name: instituicao_ensino id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicao_ensino ALTER COLUMN id SET DEFAULT nextval('public.instituicao_ensino_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 16476)
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 16477)
-- Name: pre_projeto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto ALTER COLUMN id SET DEFAULT nextval('public.pre_projeto_id_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 16478)
-- Name: professor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor ALTER COLUMN id SET DEFAULT nextval('public.professor_id_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 16479)
-- Name: relatorio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relatorio ALTER COLUMN id SET DEFAULT nextval('public.relatorio_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 16480)
-- Name: tcc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc ALTER COLUMN id SET DEFAULT nextval('public.tcc_id_seq'::regclass);


--
-- TOC entry 2079 (class 2606 OID 16482)
-- Name: aluno aluno_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pk PRIMARY KEY (id);


--
-- TOC entry 2085 (class 2606 OID 16484)
-- Name: calendario calendario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario
    ADD CONSTRAINT calendario_pk PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 16486)
-- Name: documento documento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pk PRIMARY KEY (id);


--
-- TOC entry 2091 (class 2606 OID 16488)
-- Name: estado_avaliacao estado_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_avaliacao
    ADD CONSTRAINT estado_pk PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 16490)
-- Name: instituicao_ensino insituticao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicao_ensino
    ADD CONSTRAINT insituticao_pk PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 16492)
-- Name: perfil perfil_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pk PRIMARY KEY (id);


--
-- TOC entry 2097 (class 2606 OID 16494)
-- Name: pre_projeto preprojeto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT preprojeto_pk PRIMARY KEY (id);


--
-- TOC entry 2101 (class 2606 OID 16496)
-- Name: professor professor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pk PRIMARY KEY (id);


--
-- TOC entry 2107 (class 2606 OID 16498)
-- Name: relatorio relatorio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relatorio
    ADD CONSTRAINT relatorio_pk PRIMARY KEY (id);


--
-- TOC entry 2109 (class 2606 OID 16500)
-- Name: tcc tcc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT tcc_pk PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 16502)
-- Name: aluno uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT uk UNIQUE (matricula);


--
-- TOC entry 2083 (class 2606 OID 16504)
-- Name: aluno uk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT uk2 UNIQUE (email);


--
-- TOC entry 2089 (class 2606 OID 16506)
-- Name: documento ukd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT ukd UNIQUE (id_aluno, tipo_documento);


--
-- TOC entry 2103 (class 2606 OID 16508)
-- Name: professor ukp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT ukp UNIQUE (siape);


--
-- TOC entry 2105 (class 2606 OID 16510)
-- Name: professor ukp2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT ukp2 UNIQUE (email);


--
-- TOC entry 2099 (class 2606 OID 16512)
-- Name: pre_projeto ukpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT ukpp UNIQUE (id_aluno1);


--
-- TOC entry 2111 (class 2606 OID 16514)
-- Name: tcc uktcc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT uktcc UNIQUE (id_aluno);


--
-- TOC entry 2112 (class 2606 OID 16515)
-- Name: documento fk_a_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT fk_a_documento FOREIGN KEY (id_aluno) REFERENCES public.aluno(id) ON DELETE CASCADE;


--
-- TOC entry 2122 (class 2606 OID 16520)
-- Name: tcc fk_a_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_a_tcc FOREIGN KEY (id_aluno) REFERENCES public.aluno(id) ON DELETE CASCADE;


--
-- TOC entry 2120 (class 2606 OID 16525)
-- Name: professor fk_p_instituicao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT fk_p_instituicao FOREIGN KEY (id_instituicao) REFERENCES public.instituicao_ensino(id);


--
-- TOC entry 2113 (class 2606 OID 16530)
-- Name: pre_projeto fk_p_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_p_tcc FOREIGN KEY (id_professor_orientador) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2123 (class 2606 OID 16535)
-- Name: tcc fk_p_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_p_tcc FOREIGN KEY (id_professor_orientador) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2114 (class 2606 OID 16540)
-- Name: pre_projeto fk_pc_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_pc_tcc FOREIGN KEY (id_professor_coorientador) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2124 (class 2606 OID 16545)
-- Name: tcc fk_pm_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_pm_tcc FOREIGN KEY (id_professor_membro1) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2115 (class 2606 OID 16550)
-- Name: pre_projeto fk_pp_aluno1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_pp_aluno1 FOREIGN KEY (id_aluno1) REFERENCES public.aluno(id) ON DELETE CASCADE;


--
-- TOC entry 2116 (class 2606 OID 16555)
-- Name: pre_projeto fk_pp_aluno2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_pp_aluno2 FOREIGN KEY (id_aluno2) REFERENCES public.aluno(id) ON DELETE CASCADE;


--
-- TOC entry 2117 (class 2606 OID 16560)
-- Name: pre_projeto fk_pp_professor_avaliador1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_pp_professor_avaliador1 FOREIGN KEY (id_professor_avaliador1) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2118 (class 2606 OID 16565)
-- Name: pre_projeto fk_pp_professor_avaliador2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_pp_professor_avaliador2 FOREIGN KEY (id_professor_avaliador2) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2119 (class 2606 OID 16570)
-- Name: pre_projeto fk_prof_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_projeto
    ADD CONSTRAINT fk_prof_tcc FOREIGN KEY (id_professor_coorientador) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2125 (class 2606 OID 16575)
-- Name: tcc fk_prof_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_prof_tcc FOREIGN KEY (id_professor_coorientador) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2126 (class 2606 OID 16580)
-- Name: tcc fk_profm_tcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_profm_tcc FOREIGN KEY (id_professor_membro2) REFERENCES public.professor(id) ON DELETE CASCADE;


--
-- TOC entry 2121 (class 2606 OID 16585)
-- Name: relatorio fk_t_relatorio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relatorio
    ADD CONSTRAINT fk_t_relatorio FOREIGN KEY (id_tcc) REFERENCES public.tcc(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2127 (class 2606 OID 16590)
-- Name: tcc fk_tcc_aluno2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcc
    ADD CONSTRAINT fk_tcc_aluno2 FOREIGN KEY (id_aluno2) REFERENCES public.aluno(id) ON DELETE CASCADE;


-- Completed on 2019-06-10 11:12:52

--
-- PostgreSQL database dump complete
--

