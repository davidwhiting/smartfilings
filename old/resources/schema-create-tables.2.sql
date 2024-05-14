
--
-- PostgreSQL database dump complete
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_01d31 AFTER DELETE ON public.search_court_appeals_to FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_01d31();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_01d31 ON search_court_appeals_to; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_01d31 ON public.search_court_appeals_to IS '60c71e3e490f9be107654bc74bf4149d448b4842';


--
-- Name: search_claim_tags pgtrigger_update_or_delete_snapshot_delete_02000; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_02000 AFTER DELETE ON public.search_claim_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_02000();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_02000 ON search_claim_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_02000 ON public.search_claim_tags IS '42aba7d956af67e6ec65baaaffc2ace2b65f6e32';


--
-- Name: search_opinioncluster_non_participating_judges pgtrigger_update_or_delete_snapshot_delete_0cf1a; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_0cf1a AFTER DELETE ON public.search_opinioncluster_non_participating_judges FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_0cf1a();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_0cf1a ON search_opinioncluster_non_participating_judges; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_0cf1a ON public.search_opinioncluster_non_participating_judges IS '766b364dec501c586aa483949d7a4d963ce4b9dd';


--
-- Name: search_bankruptcyinformation pgtrigger_update_or_delete_snapshot_delete_0d356; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_0d356 AFTER DELETE ON public.search_bankruptcyinformation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_0d356();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_0d356 ON search_bankruptcyinformation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_0d356 ON public.search_bankruptcyinformation IS '0af1d52bc1ed98574095fe25182a3f75bad86da6';


--
-- Name: people_db_source pgtrigger_update_or_delete_snapshot_delete_1db27; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_1db27 AFTER DELETE ON public.people_db_source FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_1db27();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_1db27 ON people_db_source; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_1db27 ON public.people_db_source IS 'af8df2f3c5785a341684b95deac86682455ca38a';


--
-- Name: search_opinion pgtrigger_update_or_delete_snapshot_delete_1f4fd; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_1f4fd AFTER DELETE ON public.search_opinion FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_1f4fd();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_1f4fd ON search_opinion; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_1f4fd ON public.search_opinion IS '889b6c94d8bc62c35c3c2a043e0a0b8495274d7a';


--
-- Name: search_docket_tags pgtrigger_update_or_delete_snapshot_delete_2e377; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_2e377 AFTER DELETE ON public.search_docket_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_2e377();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_2e377 ON search_docket_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_2e377 ON public.search_docket_tags IS '721b4078948f8c33197c1ff4b2b39b92ff7ec18c';


--
-- Name: search_claim pgtrigger_update_or_delete_snapshot_delete_304ff; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_304ff AFTER DELETE ON public.search_claim FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_304ff();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_304ff ON search_claim; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_304ff ON public.search_claim IS '494bd9b70efb5f53bd7adc4154ca7544a5744430';


--
-- Name: search_opinioncluster_panel pgtrigger_update_or_delete_snapshot_delete_36569; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_36569 AFTER DELETE ON public.search_opinioncluster_panel FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_36569();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_36569 ON search_opinioncluster_panel; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_36569 ON public.search_opinioncluster_panel IS '678011e2794bfe51cd706f39ca3579d1951751e8';


--
-- Name: people_db_school pgtrigger_update_or_delete_snapshot_delete_40dc2; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_40dc2 AFTER DELETE ON public.people_db_school FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_40dc2();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_40dc2 ON people_db_school; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_40dc2 ON public.people_db_school IS '58acc759771efced22d98781d51e16b70e962b12';


--
-- Name: search_opinioncluster pgtrigger_update_or_delete_snapshot_delete_58fe8; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_58fe8 AFTER DELETE ON public.search_opinioncluster FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_58fe8();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_58fe8 ON search_opinioncluster; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_58fe8 ON public.search_opinioncluster IS 'efad05406fc64c608bbade46146fd2dbfd61692f';


--
-- Name: search_claimhistory pgtrigger_update_or_delete_snapshot_delete_5ec04; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_5ec04 AFTER DELETE ON public.search_claimhistory FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_5ec04();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_5ec04 ON search_claimhistory; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_5ec04 ON public.search_claimhistory IS '597f99a7be8f981d0663d87313f9e563996d8340';


--
-- Name: search_opinion_joined_by pgtrigger_update_or_delete_snapshot_delete_61f2c; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_61f2c AFTER DELETE ON public.search_opinion_joined_by FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_61f2c();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_61f2c ON search_opinion_joined_by; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_61f2c ON public.search_opinion_joined_by IS '00b5edde224bc032c6c14658e102bcc65cd6ab66';


--
-- Name: audio_audio pgtrigger_update_or_delete_snapshot_delete_63666; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_63666 AFTER DELETE ON public.audio_audio FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_63666();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_63666 ON audio_audio; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_63666 ON public.audio_audio IS '3f15b50d6ff720dceeaf2b1cff5606bf76e31fba';


--
-- Name: people_db_person pgtrigger_update_or_delete_snapshot_delete_649cf; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_649cf AFTER DELETE ON public.people_db_person FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_649cf();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_649cf ON people_db_person; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_649cf ON public.people_db_person IS '0124a496982c3c63f186d9d8af372dbb97b476ea';


--
-- Name: search_docketentry_tags pgtrigger_update_or_delete_snapshot_delete_70d5c; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_70d5c AFTER DELETE ON public.search_docketentry_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_70d5c();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_70d5c ON search_docketentry_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_70d5c ON public.search_docketentry_tags IS 'b666eb4d11fb27a59a986a33049b8c91bfa9bac4';


--
-- Name: search_docket pgtrigger_update_or_delete_snapshot_delete_7294f; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_7294f AFTER DELETE ON public.search_docket FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_7294f();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_7294f ON search_docket; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_7294f ON public.search_docket IS '8e6c1664ec07a73902036cd5e1db11e48d26c59d';


--
-- Name: search_recapdocument_tags pgtrigger_update_or_delete_snapshot_delete_7889e; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_7889e AFTER DELETE ON public.search_recapdocument_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_7889e();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_7889e ON search_recapdocument_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_7889e ON public.search_recapdocument_tags IS 'dc0319ae6f78c8fd85e6f9bb0530eda57946b625';


--
-- Name: search_court pgtrigger_update_or_delete_snapshot_delete_84ec4; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_84ec4 AFTER DELETE ON public.search_court FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_84ec4();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_84ec4 ON search_court; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_84ec4 ON public.search_court IS 'd72fa3660f1c1d7de0feadd1ba92c2e70f48da07';


--
-- Name: search_citation pgtrigger_update_or_delete_snapshot_delete_9631d; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_9631d AFTER DELETE ON public.search_citation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_9631d();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_9631d ON search_citation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_9631d ON public.search_citation IS 'a555a4f1ca71feb7d3527c7cbc7b4d80fabc39ca';


--
-- Name: people_db_abarating pgtrigger_update_or_delete_snapshot_delete_9f6fd; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_9f6fd AFTER DELETE ON public.people_db_abarating FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_9f6fd();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_9f6fd ON people_db_abarating; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_9f6fd ON public.people_db_abarating IS 'f865183e7573427d166286d2aeb0c0e1fcf16d01';


--
-- Name: search_docketentry pgtrigger_update_or_delete_snapshot_delete_a9490; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_a9490 AFTER DELETE ON public.search_docketentry FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_a9490();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_a9490 ON search_docketentry; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_a9490 ON public.search_docketentry IS 'ee9abd37a698de74f812f03f41b4fb2ec70d5427';


--
-- Name: search_docket_panel pgtrigger_update_or_delete_snapshot_delete_a94e0; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_a94e0 AFTER DELETE ON public.search_docket_panel FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_a94e0();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_a94e0 ON search_docket_panel; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_a94e0 ON public.search_docket_panel IS '8ecb6e5f925731eefb56ba2745d6698fd9a289a6';


--
-- Name: search_courthouse pgtrigger_update_or_delete_snapshot_delete_aabf8; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_aabf8 AFTER DELETE ON public.search_courthouse FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_aabf8();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_aabf8 ON search_courthouse; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_aabf8 ON public.search_courthouse IS '52ca038a3b52ba39ca02facbb87977a5cd1f59a3';


--
-- Name: people_db_education pgtrigger_update_or_delete_snapshot_delete_bf937; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_bf937 AFTER DELETE ON public.people_db_education FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_bf937();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_bf937 ON people_db_education; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_bf937 ON public.people_db_education IS '9a6f99da78762bcbe0545a84ea405ac1d971e2fc';


--
-- Name: people_db_person_race pgtrigger_update_or_delete_snapshot_delete_c73dc; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_c73dc AFTER DELETE ON public.people_db_person_race FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_c73dc();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_c73dc ON people_db_person_race; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_c73dc ON public.people_db_person_race IS '150298646b18b3d85f58e33b42e493b23fe6f646';


--
-- Name: search_recapdocument pgtrigger_update_or_delete_snapshot_delete_c80e6; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_c80e6 AFTER DELETE ON public.search_recapdocument FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_c80e6();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_c80e6 ON search_recapdocument; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_c80e6 ON public.search_recapdocument IS 'd14b8419ea347c312cd092b1bd157efa6542094e';


--
-- Name: people_db_position pgtrigger_update_or_delete_snapshot_delete_ca371; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_ca371 AFTER DELETE ON public.people_db_position FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_ca371();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_ca371 ON people_db_position; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_ca371 ON public.people_db_position IS '37c3937046469b37e52aac1a4ddebd56e42a5a4f';


--
-- Name: people_db_politicalaffiliation pgtrigger_update_or_delete_snapshot_delete_d036d; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_d036d AFTER DELETE ON public.people_db_politicalaffiliation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_d036d();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_d036d ON people_db_politicalaffiliation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_d036d ON public.people_db_politicalaffiliation IS 'c192b5c62cfcf07e04e6a49ae97aaeb5ffd0d424';


--
-- Name: search_originatingcourtinformation pgtrigger_update_or_delete_snapshot_delete_eac12; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_eac12 AFTER DELETE ON public.search_originatingcourtinformation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_eac12();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_eac12 ON search_originatingcourtinformation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_eac12 ON public.search_originatingcourtinformation IS '06b286ee7c515ed6f516bcd20dd98aac86dd6a37';


--
-- Name: people_db_retentionevent pgtrigger_update_or_delete_snapshot_delete_f0c63; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f0c63 AFTER DELETE ON public.people_db_retentionevent FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f0c63();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f0c63 ON people_db_retentionevent; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f0c63 ON public.people_db_retentionevent IS 'ffbb1483333a4f0661e087cd2c5a915c1ec73d62';


--
-- Name: audio_audio_panel pgtrigger_update_or_delete_snapshot_delete_f5717; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f5717 AFTER DELETE ON public.audio_audio_panel FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f5717();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f5717 ON audio_audio_panel; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f5717 ON public.audio_audio_panel IS '8281b6cb81fc9e9dcce8dff7fe60a40dc051cd7f';


--
-- Name: people_db_race pgtrigger_update_or_delete_snapshot_delete_f6fcc; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f6fcc AFTER DELETE ON public.people_db_race FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f6fcc();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f6fcc ON people_db_race; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f6fcc ON public.people_db_race IS '04b6ad1015070427b423239f7f7dc486e8453c75';


--
-- Name: search_tag pgtrigger_update_or_delete_snapshot_delete_f9b8e; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f9b8e AFTER DELETE ON public.search_tag FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f9b8e();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f9b8e ON search_tag; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f9b8e ON public.search_tag IS '5b506e8962af3d28654705eacd859080cc526298';


--
-- Name: people_db_position pgtrigger_update_or_delete_snapshot_update_0586a; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_0586a AFTER UPDATE ON public.people_db_position FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.position_type)::text IS DISTINCT FROM (new.position_type)::text) OR ((old.job_title)::text IS DISTINCT FROM (new.job_title)::text) OR (old.sector IS DISTINCT FROM new.sector) OR (old.person_id IS DISTINCT FROM new.person_id) OR ((old.court_id)::text IS DISTINCT FROM (new.court_id)::text) OR (old.school_id IS DISTINCT FROM new.school_id) OR ((old.organization_name)::text IS DISTINCT FROM (new.organization_name)::text) OR ((old.location_city)::text IS DISTINCT FROM (new.location_city)::text) OR ((old.location_state)::text IS DISTINCT FROM (new.location_state)::text) OR (old.appointer_id IS DISTINCT FROM new.appointer_id) OR (old.supervisor_id IS DISTINCT FROM new.supervisor_id) OR (old.predecessor_id IS DISTINCT FROM new.predecessor_id) OR (old.date_nominated IS DISTINCT FROM new.date_nominated) OR (old.date_elected IS DISTINCT FROM new.date_elected) OR (old.date_recess_appointment IS DISTINCT FROM new.date_recess_appointment) OR (old.date_referred_to_judicial_committee IS DISTINCT FROM new.date_referred_to_judicial_committee) OR (old.date_judicial_committee_action IS DISTINCT FROM new.date_judicial_committee_action) OR ((old.judicial_committee_action)::text IS DISTINCT FROM (new.judicial_committee_action)::text) OR (old.date_hearing IS DISTINCT FROM new.date_hearing) OR (old.date_confirmation IS DISTINCT FROM new.date_confirmation) OR (old.date_start IS DISTINCT FROM new.date_start) OR ((old.date_granularity_start)::text IS DISTINCT FROM (new.date_granularity_start)::text) OR (old.date_termination IS DISTINCT FROM new.date_termination) OR ((old.termination_reason)::text IS DISTINCT FROM (new.termination_reason)::text) OR ((old.date_granularity_termination)::text IS DISTINCT FROM (new.date_granularity_termination)::text) OR (old.date_retirement IS DISTINCT FROM new.date_retirement) OR ((old.nomination_process)::text IS DISTINCT FROM (new.nomination_process)::text) OR ((old.vote_type)::text IS DISTINCT FROM (new.vote_type)::text) OR (old.voice_vote IS DISTINCT FROM new.voice_vote) OR (old.votes_yes IS DISTINCT FROM new.votes_yes) OR (old.votes_no IS DISTINCT FROM new.votes_no) OR (old.votes_yes_percent IS DISTINCT FROM new.votes_yes_percent) OR (old.votes_no_percent IS DISTINCT FROM new.votes_no_percent) OR ((old.how_selected)::text IS DISTINCT FROM (new.how_selected)::text) OR (old.has_inferred_values IS DISTINCT FROM new.has_inferred_values))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_0586a();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_0586a ON people_db_position; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_0586a ON public.people_db_position IS '0a03fa6888352997aeba8315cf01e6fa6735ba95';


--
-- Name: people_db_person pgtrigger_update_or_delete_snapshot_update_0f619; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_0f619 AFTER UPDATE ON public.people_db_person FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.is_alias_of_id IS DISTINCT FROM new.is_alias_of_id) OR (old.date_completed IS DISTINCT FROM new.date_completed) OR (old.fjc_id IS DISTINCT FROM new.fjc_id) OR ((old.slug)::text IS DISTINCT FROM (new.slug)::text) OR ((old.name_first)::text IS DISTINCT FROM (new.name_first)::text) OR ((old.name_middle)::text IS DISTINCT FROM (new.name_middle)::text) OR ((old.name_last)::text IS DISTINCT FROM (new.name_last)::text) OR ((old.name_suffix)::text IS DISTINCT FROM (new.name_suffix)::text) OR (old.date_dob IS DISTINCT FROM new.date_dob) OR ((old.date_granularity_dob)::text IS DISTINCT FROM (new.date_granularity_dob)::text) OR (old.date_dod IS DISTINCT FROM new.date_dod) OR ((old.date_granularity_dod)::text IS DISTINCT FROM (new.date_granularity_dod)::text) OR ((old.dob_city)::text IS DISTINCT FROM (new.dob_city)::text) OR ((old.dob_state)::text IS DISTINCT FROM (new.dob_state)::text) OR ((old.dob_country)::text IS DISTINCT FROM (new.dob_country)::text) OR ((old.dod_city)::text IS DISTINCT FROM (new.dod_city)::text) OR ((old.dod_state)::text IS DISTINCT FROM (new.dod_state)::text) OR ((old.dod_country)::text IS DISTINCT FROM (new.dod_country)::text) OR ((old.gender)::text IS DISTINCT FROM (new.gender)::text) OR ((old.religion)::text IS DISTINCT FROM (new.religion)::text) OR (old.ftm_total_received IS DISTINCT FROM new.ftm_total_received) OR ((old.ftm_eid)::text IS DISTINCT FROM (new.ftm_eid)::text) OR (old.has_photo IS DISTINCT FROM new.has_photo))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_0f619();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_0f619 ON people_db_person; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_0f619 ON public.people_db_person IS '08ac51839dafb5c0605bd71dcf96c6a08ec56db5';


--
-- Name: search_claimhistory pgtrigger_update_or_delete_snapshot_update_137a5; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_137a5 AFTER UPDATE ON public.search_claimhistory FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR (old.page_count IS DISTINCT FROM new.page_count) OR (old.file_size IS DISTINCT FROM new.file_size) OR ((old.filepath_local)::text IS DISTINCT FROM (new.filepath_local)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR ((old.thumbnail)::text IS DISTINCT FROM (new.thumbnail)::text) OR (old.thumbnail_status IS DISTINCT FROM new.thumbnail_status) OR (old.plain_text IS DISTINCT FROM new.plain_text) OR (old.ocr_status IS DISTINCT FROM new.ocr_status) OR (old.date_upload IS DISTINCT FROM new.date_upload) OR ((old.document_number)::text IS DISTINCT FROM (new.document_number)::text) OR (old.attachment_number IS DISTINCT FROM new.attachment_number) OR ((old.pacer_doc_id)::text IS DISTINCT FROM (new.pacer_doc_id)::text) OR (old.is_available IS DISTINCT FROM new.is_available) OR (old.is_free_on_pacer IS DISTINCT FROM new.is_free_on_pacer) OR (old.is_sealed IS DISTINCT FROM new.is_sealed) OR (old.claim_id IS DISTINCT FROM new.claim_id) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.claim_document_type IS DISTINCT FROM new.claim_document_type) OR (old.description IS DISTINCT FROM new.description) OR ((old.claim_doc_id)::text IS DISTINCT FROM (new.claim_doc_id)::text) OR (old.pacer_dm_id IS DISTINCT FROM new.pacer_dm_id) OR ((old.pacer_case_id)::text IS DISTINCT FROM (new.pacer_case_id)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_137a5();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_137a5 ON search_claimhistory; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_137a5 ON public.search_claimhistory IS 'c4f2a33aa09534f0db6c38a62b0c4e2d656d1db0';


--
-- Name: search_bankruptcyinformation pgtrigger_update_or_delete_snapshot_update_17e86; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_17e86 AFTER UPDATE ON public.search_bankruptcyinformation FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.date_converted IS DISTINCT FROM new.date_converted) OR (old.date_last_to_file_claims IS DISTINCT FROM new.date_last_to_file_claims) OR (old.date_last_to_file_govt IS DISTINCT FROM new.date_last_to_file_govt) OR (old.date_debtor_dismissed IS DISTINCT FROM new.date_debtor_dismissed) OR ((old.chapter)::text IS DISTINCT FROM (new.chapter)::text) OR (old.trustee_str IS DISTINCT FROM new.trustee_str))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_17e86();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_17e86 ON search_bankruptcyinformation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_17e86 ON public.search_bankruptcyinformation IS '85d1a7878d466326c90c68b401f107b1158c2796';


--
-- Name: search_claim_tags pgtrigger_update_or_delete_snapshot_update_22c0b; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_22c0b AFTER UPDATE ON public.search_claim_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_22c0b();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_22c0b ON search_claim_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_22c0b ON public.search_claim_tags IS '885105aa8b20d2722401b2e8abdf09482a9daaab';


--
-- Name: search_docketentry pgtrigger_update_or_delete_snapshot_update_46e1e; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_46e1e AFTER UPDATE ON public.search_docketentry FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.time_filed IS DISTINCT FROM new.time_filed) OR (old.entry_number IS DISTINCT FROM new.entry_number) OR ((old.recap_sequence_number)::text IS DISTINCT FROM (new.recap_sequence_number)::text) OR (old.pacer_sequence_number IS DISTINCT FROM new.pacer_sequence_number) OR (old.description IS DISTINCT FROM new.description))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_46e1e();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_46e1e ON search_docketentry; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_46e1e ON public.search_docketentry IS '2330fe784864bcc2d76ebe1d4a07e7819fa8de38';


--
-- Name: people_db_school pgtrigger_update_or_delete_snapshot_update_471f3; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_471f3 AFTER UPDATE ON public.people_db_school FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.is_alias_of_id IS DISTINCT FROM new.is_alias_of_id) OR ((old.name)::text IS DISTINCT FROM (new.name)::text) OR (old.ein IS DISTINCT FROM new.ein))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_471f3();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_471f3 ON people_db_school; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_471f3 ON public.people_db_school IS 'fcb9b90cd9230495908dec047c6d260c1ead3dd5';


--
-- Name: search_opinioncluster_non_participating_judges pgtrigger_update_or_delete_snapshot_update_477cb; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_477cb AFTER UPDATE ON public.search_opinioncluster_non_participating_judges FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_477cb();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_477cb ON search_opinioncluster_non_participating_judges; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_477cb ON public.search_opinioncluster_non_participating_judges IS '670999bc5589f6b494f23649d7b439b0d5fa0738';


--
-- Name: search_originatingcourtinformation pgtrigger_update_or_delete_snapshot_update_49538; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_49538 AFTER UPDATE ON public.search_originatingcourtinformation FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_number IS DISTINCT FROM new.docket_number) OR (old.assigned_to_id IS DISTINCT FROM new.assigned_to_id) OR (old.assigned_to_str IS DISTINCT FROM new.assigned_to_str) OR (old.ordering_judge_id IS DISTINCT FROM new.ordering_judge_id) OR (old.ordering_judge_str IS DISTINCT FROM new.ordering_judge_str) OR (old.court_reporter IS DISTINCT FROM new.court_reporter) OR (old.date_disposed IS DISTINCT FROM new.date_disposed) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.date_judgment IS DISTINCT FROM new.date_judgment) OR (old.date_judgment_eod IS DISTINCT FROM new.date_judgment_eod) OR (old.date_filed_noa IS DISTINCT FROM new.date_filed_noa) OR (old.date_received_coa IS DISTINCT FROM new.date_received_coa))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_49538();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_49538 ON search_originatingcourtinformation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_49538 ON public.search_originatingcourtinformation IS '5d249a18e8be51afa8c54132770efcdde2b47a61';


--
-- Name: people_db_education pgtrigger_update_or_delete_snapshot_update_4e1c4; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_4e1c4 AFTER UPDATE ON public.people_db_education FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR (old.school_id IS DISTINCT FROM new.school_id) OR ((old.degree_level)::text IS DISTINCT FROM (new.degree_level)::text) OR ((old.degree_detail)::text IS DISTINCT FROM (new.degree_detail)::text) OR (old.degree_year IS DISTINCT FROM new.degree_year))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_4e1c4();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_4e1c4 ON people_db_education; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_4e1c4 ON public.people_db_education IS 'c0837209f26fcd9f74a4b0032277e97122c8a369';


--
-- Name: audio_audio_panel pgtrigger_update_or_delete_snapshot_update_4e441; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_4e441 AFTER UPDATE ON public.audio_audio_panel FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_4e441();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_4e441 ON audio_audio_panel; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_4e441 ON public.audio_audio_panel IS '9cadb65943a3d38e84beba67c55089ef7955f87e';


--
-- Name: people_db_politicalaffiliation pgtrigger_update_or_delete_snapshot_update_54863; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_54863 AFTER UPDATE ON public.people_db_politicalaffiliation FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR ((old.political_party)::text IS DISTINCT FROM (new.political_party)::text) OR ((old.source)::text IS DISTINCT FROM (new.source)::text) OR (old.date_start IS DISTINCT FROM new.date_start) OR ((old.date_granularity_start)::text IS DISTINCT FROM (new.date_granularity_start)::text) OR (old.date_end IS DISTINCT FROM new.date_end) OR ((old.date_granularity_end)::text IS DISTINCT FROM (new.date_granularity_end)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_54863();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_54863 ON people_db_politicalaffiliation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_54863 ON public.people_db_politicalaffiliation IS '0690cb3e0c0915ec679829351fc663db56d56b81';


--
-- Name: search_opinioncluster_panel pgtrigger_update_or_delete_snapshot_update_565f2; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_565f2 AFTER UPDATE ON public.search_opinioncluster_panel FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_565f2();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_565f2 ON search_opinioncluster_panel; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_565f2 ON public.search_opinioncluster_panel IS '57d19471902fa2b87020b44766bdd63104a4b737';


--
-- Name: people_db_abarating pgtrigger_update_or_delete_snapshot_update_5d5cb; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_5d5cb AFTER UPDATE ON public.people_db_abarating FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR (old.year_rated IS DISTINCT FROM new.year_rated) OR ((old.rating)::text IS DISTINCT FROM (new.rating)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_5d5cb();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_5d5cb ON people_db_abarating; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_5d5cb ON public.people_db_abarating IS '13f74349ae81148bf7b34818895d2e9894c93b7e';


--
-- Name: audio_audio pgtrigger_update_or_delete_snapshot_update_63362; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_63362 AFTER UPDATE ON public.audio_audio FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR ((old.source)::text IS DISTINCT FROM (new.source)::text) OR (old.case_name_short IS DISTINCT FROM new.case_name_short) OR (old.case_name IS DISTINCT FROM new.case_name) OR (old.case_name_full IS DISTINCT FROM new.case_name_full) OR (old.judges IS DISTINCT FROM new.judges) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR ((old.download_url)::text IS DISTINCT FROM (new.download_url)::text) OR ((old.local_path_mp3)::text IS DISTINCT FROM (new.local_path_mp3)::text) OR ((old.local_path_original_file)::text IS DISTINCT FROM (new.local_path_original_file)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR (old.duration IS DISTINCT FROM new.duration) OR (old.processing_complete IS DISTINCT FROM new.processing_complete) OR (old.date_blocked IS DISTINCT FROM new.date_blocked) OR (old.blocked IS DISTINCT FROM new.blocked) OR (old.stt_status IS DISTINCT FROM new.stt_status) OR (old.stt_google_response IS DISTINCT FROM new.stt_google_response))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_63362();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_63362 ON audio_audio; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_63362 ON public.audio_audio IS '64184a9d143b2a4e59fd385994e9971e5ea4cbbc';


--
-- Name: search_opinion pgtrigger_update_or_delete_snapshot_update_67ecd; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_67ecd AFTER UPDATE ON public.search_opinion FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.cluster_id IS DISTINCT FROM new.cluster_id) OR (old.author_id IS DISTINCT FROM new.author_id) OR (old.author_str IS DISTINCT FROM new.author_str) OR (old.per_curiam IS DISTINCT FROM new.per_curiam) OR (old.joined_by_str IS DISTINCT FROM new.joined_by_str) OR ((old.type)::text IS DISTINCT FROM (new.type)::text) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR (old.page_count IS DISTINCT FROM new.page_count) OR ((old.download_url)::text IS DISTINCT FROM (new.download_url)::text) OR ((old.local_path)::text IS DISTINCT FROM (new.local_path)::text) OR (old.plain_text IS DISTINCT FROM new.plain_text) OR (old.html IS DISTINCT FROM new.html) OR (old.html_lawbox IS DISTINCT FROM new.html_lawbox) OR (old.html_columbia IS DISTINCT FROM new.html_columbia) OR (old.html_anon_2020 IS DISTINCT FROM new.html_anon_2020) OR (old.xml_harvard IS DISTINCT FROM new.xml_harvard) OR (old.html_with_citations IS DISTINCT FROM new.html_with_citations) OR (old.extracted_by_ocr IS DISTINCT FROM new.extracted_by_ocr))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_67ecd();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_67ecd ON search_opinion; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_67ecd ON public.search_opinion IS '4a3d82790ac0cbd840d6a7f6c136d4cc65419e5e';


--
-- Name: search_opinioncluster pgtrigger_update_or_delete_snapshot_update_6a181; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_6a181 AFTER UPDATE ON public.search_opinioncluster FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.judges IS DISTINCT FROM new.judges) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.date_filed_is_approximate IS DISTINCT FROM new.date_filed_is_approximate) OR ((old.slug)::text IS DISTINCT FROM (new.slug)::text) OR (old.case_name_short IS DISTINCT FROM new.case_name_short) OR (old.case_name IS DISTINCT FROM new.case_name) OR (old.case_name_full IS DISTINCT FROM new.case_name_full) OR ((old.scdb_id)::text IS DISTINCT FROM (new.scdb_id)::text) OR (old.scdb_decision_direction IS DISTINCT FROM new.scdb_decision_direction) OR (old.scdb_votes_majority IS DISTINCT FROM new.scdb_votes_majority) OR (old.scdb_votes_minority IS DISTINCT FROM new.scdb_votes_minority) OR ((old.source)::text IS DISTINCT FROM (new.source)::text) OR (old.procedural_history IS DISTINCT FROM new.procedural_history) OR (old.attorneys IS DISTINCT FROM new.attorneys) OR (old.nature_of_suit IS DISTINCT FROM new.nature_of_suit) OR (old.posture IS DISTINCT FROM new.posture) OR (old.syllabus IS DISTINCT FROM new.syllabus) OR (old.headnotes IS DISTINCT FROM new.headnotes) OR (old.summary IS DISTINCT FROM new.summary) OR (old.disposition IS DISTINCT FROM new.disposition) OR (old.history IS DISTINCT FROM new.history) OR (old.other_dates IS DISTINCT FROM new.other_dates) OR (old.cross_reference IS DISTINCT FROM new.cross_reference) OR (old.correction IS DISTINCT FROM new.correction) OR (old.citation_count IS DISTINCT FROM new.citation_count) OR ((old.precedential_status)::text IS DISTINCT FROM (new.precedential_status)::text) OR (old.date_blocked IS DISTINCT FROM new.date_blocked) OR (old.blocked IS DISTINCT FROM new.blocked) OR ((old.filepath_json_harvard)::text IS DISTINCT FROM (new.filepath_json_harvard)::text) OR (old.arguments IS DISTINCT FROM new.arguments) OR (old.headmatter IS DISTINCT FROM new.headmatter))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_6a181();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_6a181 ON search_opinioncluster; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_6a181 ON public.search_opinioncluster IS 'a186ab65e2b0b6da774524ca6948808bf68a4f93';


--
-- Name: search_opinion_joined_by pgtrigger_update_or_delete_snapshot_update_6be54; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_6be54 AFTER UPDATE ON public.search_opinion_joined_by FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_6be54();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_6be54 ON search_opinion_joined_by; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_6be54 ON public.search_opinion_joined_by IS '492f94ff83c291215ae07c18c238b2c71e843e04';


--
-- Name: search_docket pgtrigger_update_or_delete_snapshot_update_7e039; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_7e039 AFTER UPDATE ON public.search_docket FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.source IS DISTINCT FROM new.source) OR ((old.court_id)::text IS DISTINCT FROM (new.court_id)::text) OR ((old.appeal_from_id)::text IS DISTINCT FROM (new.appeal_from_id)::text) OR (old.appeal_from_str IS DISTINCT FROM new.appeal_from_str) OR (old.originating_court_information_id IS DISTINCT FROM new.originating_court_information_id) OR (old.idb_data_id IS DISTINCT FROM new.idb_data_id) OR (old.assigned_to_id IS DISTINCT FROM new.assigned_to_id) OR (old.assigned_to_str IS DISTINCT FROM new.assigned_to_str) OR (old.referred_to_id IS DISTINCT FROM new.referred_to_id) OR (old.referred_to_str IS DISTINCT FROM new.referred_to_str) OR (old.panel_str IS DISTINCT FROM new.panel_str) OR (old.date_last_index IS DISTINCT FROM new.date_last_index) OR (old.date_cert_granted IS DISTINCT FROM new.date_cert_granted) OR (old.date_cert_denied IS DISTINCT FROM new.date_cert_denied) OR (old.date_argued IS DISTINCT FROM new.date_argued) OR (old.date_reargued IS DISTINCT FROM new.date_reargued) OR (old.date_reargument_denied IS DISTINCT FROM new.date_reargument_denied) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.date_terminated IS DISTINCT FROM new.date_terminated) OR (old.date_last_filing IS DISTINCT FROM new.date_last_filing) OR (old.case_name_short IS DISTINCT FROM new.case_name_short) OR (old.case_name IS DISTINCT FROM new.case_name) OR (old.case_name_full IS DISTINCT FROM new.case_name_full) OR ((old.slug)::text IS DISTINCT FROM (new.slug)::text) OR (old.docket_number IS DISTINCT FROM new.docket_number) OR ((old.docket_number_core)::text IS DISTINCT FROM (new.docket_number_core)::text) OR ((old.pacer_case_id)::text IS DISTINCT FROM (new.pacer_case_id)::text) OR ((old.cause)::text IS DISTINCT FROM (new.cause)::text) OR ((old.nature_of_suit)::text IS DISTINCT FROM (new.nature_of_suit)::text) OR ((old.jury_demand)::text IS DISTINCT FROM (new.jury_demand)::text) OR ((old.jurisdiction_type)::text IS DISTINCT FROM (new.jurisdiction_type)::text) OR (old.appellate_fee_status IS DISTINCT FROM new.appellate_fee_status) OR (old.appellate_case_type_information IS DISTINCT FROM new.appellate_case_type_information) OR ((old.mdl_status)::text IS DISTINCT FROM (new.mdl_status)::text) OR ((old.filepath_local)::text IS DISTINCT FROM (new.filepath_local)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR ((old.filepath_ia_json)::text IS DISTINCT FROM (new.filepath_ia_json)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR (old.ia_needs_upload IS DISTINCT FROM new.ia_needs_upload) OR (old.ia_date_first_change IS DISTINCT FROM new.ia_date_first_change) OR (old.date_blocked IS DISTINCT FROM new.date_blocked) OR (old.blocked IS DISTINCT FROM new.blocked))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_7e039();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_7e039 ON search_docket; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_7e039 ON public.search_docket IS 'cab7d35a7309b21c85f837b8a6c4759febe46fd8';


--
-- Name: people_db_source pgtrigger_update_or_delete_snapshot_update_88fe4; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_88fe4 AFTER UPDATE ON public.people_db_source FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR ((old.url)::text IS DISTINCT FROM (new.url)::text) OR (old.date_accessed IS DISTINCT FROM new.date_accessed) OR (old.notes IS DISTINCT FROM new.notes))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_88fe4();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_88fe4 ON people_db_source; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_88fe4 ON public.people_db_source IS '7d04b1b7898b11902defc3b43ccbcff539cf174c';


--
-- Name: search_recapdocument pgtrigger_update_or_delete_snapshot_update_8a108; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_8a108 AFTER UPDATE ON public.search_recapdocument FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR (old.page_count IS DISTINCT FROM new.page_count) OR (old.file_size IS DISTINCT FROM new.file_size) OR ((old.filepath_local)::text IS DISTINCT FROM (new.filepath_local)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR ((old.thumbnail)::text IS DISTINCT FROM (new.thumbnail)::text) OR (old.thumbnail_status IS DISTINCT FROM new.thumbnail_status) OR (old.plain_text IS DISTINCT FROM new.plain_text) OR (old.ocr_status IS DISTINCT FROM new.ocr_status) OR (old.date_upload IS DISTINCT FROM new.date_upload) OR ((old.document_number)::text IS DISTINCT FROM (new.document_number)::text) OR (old.attachment_number IS DISTINCT FROM new.attachment_number) OR ((old.pacer_doc_id)::text IS DISTINCT FROM (new.pacer_doc_id)::text) OR (old.is_available IS DISTINCT FROM new.is_available) OR (old.is_free_on_pacer IS DISTINCT FROM new.is_free_on_pacer) OR (old.is_sealed IS DISTINCT FROM new.is_sealed) OR (old.docket_entry_id IS DISTINCT FROM new.docket_entry_id) OR (old.document_type IS DISTINCT FROM new.document_type) OR (old.description IS DISTINCT FROM new.description))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_8a108();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_8a108 ON search_recapdocument; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_8a108 ON public.search_recapdocument IS 'a3e0c759d8c03f380dd3eddfcff551091fcee1d1';


--
-- Name: search_citation pgtrigger_update_or_delete_snapshot_update_8f120; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_8f120 AFTER UPDATE ON public.search_citation FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_8f120();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_8f120 ON search_citation; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_8f120 ON public.search_citation IS '65de02f1d9d58195dfe662ebc3be0a695327e61f';


--
-- Name: people_db_race pgtrigger_update_or_delete_snapshot_update_a4b83; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_a4b83 AFTER UPDATE ON public.people_db_race FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_a4b83();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_a4b83 ON people_db_race; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_a4b83 ON public.people_db_race IS '8d9f6a71b0465ca997d273d204aafa2c10689c6f';


--
-- Name: search_claim pgtrigger_update_or_delete_snapshot_update_bb32f; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_bb32f AFTER UPDATE ON public.search_claim FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.date_claim_modified IS DISTINCT FROM new.date_claim_modified) OR (old.date_original_entered IS DISTINCT FROM new.date_original_entered) OR (old.date_original_filed IS DISTINCT FROM new.date_original_filed) OR (old.date_last_amendment_entered IS DISTINCT FROM new.date_last_amendment_entered) OR (old.date_last_amendment_filed IS DISTINCT FROM new.date_last_amendment_filed) OR ((old.claim_number)::text IS DISTINCT FROM (new.claim_number)::text) OR (old.creditor_details IS DISTINCT FROM new.creditor_details) OR ((old.creditor_id)::text IS DISTINCT FROM (new.creditor_id)::text) OR ((old.status)::text IS DISTINCT FROM (new.status)::text) OR ((old.entered_by)::text IS DISTINCT FROM (new.entered_by)::text) OR ((old.filed_by)::text IS DISTINCT FROM (new.filed_by)::text) OR ((old.amount_claimed)::text IS DISTINCT FROM (new.amount_claimed)::text) OR ((old.unsecured_claimed)::text IS DISTINCT FROM (new.unsecured_claimed)::text) OR ((old.secured_claimed)::text IS DISTINCT FROM (new.secured_claimed)::text) OR ((old.priority_claimed)::text IS DISTINCT FROM (new.priority_claimed)::text) OR (old.description IS DISTINCT FROM new.description) OR (old.remarks IS DISTINCT FROM new.remarks))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_bb32f();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_bb32f ON search_claim; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_bb32f ON public.search_claim IS '5a3fde0d49f7f04afe30f9151a8b3535710ec1a0';


--
-- Name: search_court pgtrigger_update_or_delete_snapshot_update_c94ab; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_c94ab AFTER UPDATE ON public.search_court FOR EACH ROW WHEN ((((old.id)::text IS DISTINCT FROM (new.id)::text) OR ((old.parent_court_id)::text IS DISTINCT FROM (new.parent_court_id)::text) OR (old.pacer_court_id IS DISTINCT FROM new.pacer_court_id) OR (old.pacer_has_rss_feed IS DISTINCT FROM new.pacer_has_rss_feed) OR (old.pacer_rss_entry_types IS DISTINCT FROM new.pacer_rss_entry_types) OR (old.date_last_pacer_contact IS DISTINCT FROM new.date_last_pacer_contact) OR ((old.fjc_court_id)::text IS DISTINCT FROM (new.fjc_court_id)::text) OR (old.in_use IS DISTINCT FROM new.in_use) OR (old.has_opinion_scraper IS DISTINCT FROM new.has_opinion_scraper) OR (old.has_oral_argument_scraper IS DISTINCT FROM new.has_oral_argument_scraper) OR (old."position" IS DISTINCT FROM new."position") OR ((old.citation_string)::text IS DISTINCT FROM (new.citation_string)::text) OR ((old.short_name)::text IS DISTINCT FROM (new.short_name)::text) OR ((old.full_name)::text IS DISTINCT FROM (new.full_name)::text) OR ((old.url)::text IS DISTINCT FROM (new.url)::text) OR (old.start_date IS DISTINCT FROM new.start_date) OR (old.end_date IS DISTINCT FROM new.end_date) OR ((old.jurisdiction)::text IS DISTINCT FROM (new.jurisdiction)::text) OR (old.notes IS DISTINCT FROM new.notes))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_c94ab();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_c94ab ON search_court; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_c94ab ON public.search_court IS 'd886ec89d1364a03c4f04630b4a0e1363d97fcc1';


--
-- Name: search_tag pgtrigger_update_or_delete_snapshot_update_c9dd9; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_c9dd9 AFTER UPDATE ON public.search_tag FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.name)::text IS DISTINCT FROM (new.name)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_c9dd9();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_c9dd9 ON search_tag; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_c9dd9 ON public.search_tag IS '4071657dcfe71811e9e7a5c24dd77c22f81d7377';


--
-- Name: search_court_appeals_to pgtrigger_update_or_delete_snapshot_update_cc38c; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_cc38c AFTER UPDATE ON public.search_court_appeals_to FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_cc38c();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_cc38c ON search_court_appeals_to; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_cc38c ON public.search_court_appeals_to IS '5224e4a3e58a56dba44b76077e4915f981134af3';


--
-- Name: search_docket_tags pgtrigger_update_or_delete_snapshot_update_cccf1; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_cccf1 AFTER UPDATE ON public.search_docket_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_cccf1();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_cccf1 ON search_docket_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_cccf1 ON public.search_docket_tags IS 'd8a33a2b78a2decf28890b2026a4682a18447cc9';


--
-- Name: search_docket_panel pgtrigger_update_or_delete_snapshot_update_cde02; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_cde02 AFTER UPDATE ON public.search_docket_panel FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_cde02();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_cde02 ON search_docket_panel; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_cde02 ON public.search_docket_panel IS '35a29a72e85fa323509c07252f31be407f36d53b';


--
-- Name: people_db_person_race pgtrigger_update_or_delete_snapshot_update_d9c4d; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_d9c4d AFTER UPDATE ON public.people_db_person_race FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_d9c4d();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_d9c4d ON people_db_person_race; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_d9c4d ON public.people_db_person_race IS 'e9b396c2a7e0eba486ceb421c26e54f6fe9e55ae';


--
-- Name: search_docketentry_tags pgtrigger_update_or_delete_snapshot_update_e280b; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_e280b AFTER UPDATE ON public.search_docketentry_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_e280b();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_e280b ON search_docketentry_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_e280b ON public.search_docketentry_tags IS '1deb034e15b750033fcb98063dc7909f397a8a1c';


--
-- Name: search_courthouse pgtrigger_update_or_delete_snapshot_update_e394a; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_e394a AFTER UPDATE ON public.search_courthouse FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_e394a();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_e394a ON search_courthouse; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_e394a ON public.search_courthouse IS 'b3a38d787937fd3591951860f2bf9fc980f8f87f';


--
-- Name: search_recapdocument_tags pgtrigger_update_or_delete_snapshot_update_e5a2f; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_e5a2f AFTER UPDATE ON public.search_recapdocument_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_e5a2f();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_e5a2f ON search_recapdocument_tags; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_e5a2f ON public.search_recapdocument_tags IS '35c12ee6109930e9bc66a39a51aee8a5f8ffcdf7';


--
-- Name: people_db_retentionevent pgtrigger_update_or_delete_snapshot_update_ef1b8; Type: TRIGGER; Schema: public; Owner: django
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_ef1b8 AFTER UPDATE ON public.people_db_retentionevent FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.position_id IS DISTINCT FROM new.position_id) OR ((old.retention_type)::text IS DISTINCT FROM (new.retention_type)::text) OR (old.date_retention IS DISTINCT FROM new.date_retention) OR (old.votes_yes IS DISTINCT FROM new.votes_yes) OR (old.votes_no IS DISTINCT FROM new.votes_no) OR (old.votes_yes_percent IS DISTINCT FROM new.votes_yes_percent) OR (old.votes_no_percent IS DISTINCT FROM new.votes_no_percent) OR (old.unopposed IS DISTINCT FROM new.unopposed) OR (old.won IS DISTINCT FROM new.won))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_ef1b8();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_ef1b8 ON people_db_retentionevent; Type: COMMENT; Schema: public; Owner: django
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_ef1b8 ON public.people_db_retentionevent IS '52253b9ece6ddd4e044b41b5f840d2e46791fb7a';


--
-- Name: search_docket a2a62b7d002101ae4c4663cdd1dfc075; Type: FK CONSTRAINT; Schema: public; Owner: django
--


