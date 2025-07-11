PGDMP                      }         	   celebaldb    17.5    17.5 a    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    33884 	   celebaldb    DATABASE     |   CREATE DATABASE celebaldb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE celebaldb;
                     new_user    false            �            1259    33939    bst    TABLE     :   CREATE TABLE public.bst (
    n integer,
    p integer
);
    DROP TABLE public.bst;
       public         heap r       postgres    false            �           0    0 	   TABLE bst    ACL     +   GRANT ALL ON TABLE public.bst TO new_user;
          public               postgres    false    232            �            1259    33963    bu_monthly_data    TABLE     |   CREATE TABLE public.bu_monthly_data (
    month character varying(20),
    cost numeric(12,2),
    revenue numeric(12,2)
);
 #   DROP TABLE public.bu_monthly_data;
       public         heap r       postgres    false            �           0    0    TABLE bu_monthly_data    ACL     7   GRANT ALL ON TABLE public.bu_monthly_data TO new_user;
          public               postgres    false    239            �            1259    33913 
   challenges    TABLE     U   CREATE TABLE public.challenges (
    challenge_id integer,
    college_id integer
);
    DROP TABLE public.challenges;
       public         heap r       postgres    false            �           0    0    TABLE challenges    ACL     2   GRANT ALL ON TABLE public.challenges TO new_user;
          public               postgres    false    224            �            1259    33910    colleges    TABLE     Q   CREATE TABLE public.colleges (
    college_id integer,
    contest_id integer
);
    DROP TABLE public.colleges;
       public         heap r       postgres    false            �           0    0    TABLE colleges    ACL     0   GRANT ALL ON TABLE public.colleges TO new_user;
          public               postgres    false    223            �            1259    33942    company    TABLE     k   CREATE TABLE public.company (
    company_code character varying(10),
    founder character varying(50)
);
    DROP TABLE public.company;
       public         heap r       postgres    false            �           0    0    TABLE company    ACL     /   GRANT ALL ON TABLE public.company TO new_user;
          public               postgres    false    233            �            1259    33907    contests    TABLE     p   CREATE TABLE public.contests (
    contest_id integer,
    hacker_id integer,
    name character varying(50)
);
    DROP TABLE public.contests;
       public         heap r       postgres    false            �           0    0    TABLE contests    ACL     0   GRANT ALL ON TABLE public.contests TO new_user;
          public               postgres    false    222            �            1259    33954    employee    TABLE     �   CREATE TABLE public.employee (
    employee_code character varying(10),
    manager_code character varying(10),
    senior_manager_code character varying(10),
    lead_manager_code character varying(10),
    company_code character varying(10)
);
    DROP TABLE public.employee;
       public         heap r       postgres    false            �           0    0    TABLE employee    ACL     0   GRANT ALL ON TABLE public.employee TO new_user;
          public               postgres    false    237            �            1259    33986    employee_cost    TABLE     �   CREATE TABLE public.employee_cost (
    employee_id integer,
    employee_name character varying(50),
    cost numeric(10,2),
    month character varying(20),
    bu character varying(50),
    weightage numeric(5,2)
);
 !   DROP TABLE public.employee_cost;
       public         heap r       postgres    false            �           0    0    TABLE employee_cost    ACL     5   GRANT ALL ON TABLE public.employee_cost TO new_user;
          public               postgres    false    243            �            1259    33966 	   employees    TABLE     �   CREATE TABLE public.employees (
    employee_id integer,
    sub_band character varying(20),
    department character varying(50)
);
    DROP TABLE public.employees;
       public         heap r       postgres    false            �           0    0    TABLE employees    ACL     1   GRANT ALL ON TABLE public.employees TO new_user;
          public               postgres    false    240            �            1259    33969 
   employees2    TABLE     �   CREATE TABLE public.employees2 (
    employee_id integer,
    employee_name character varying(50),
    salary numeric(10,2),
    department character varying(50)
);
    DROP TABLE public.employees2;
       public         heap r       postgres    false            �           0    0    TABLE employees2    ACL     2   GRANT ALL ON TABLE public.employees2 TO new_user;
          public               postgres    false    241            �            1259    33989 
   employees3    TABLE        CREATE TABLE public.employees3 (
    employee_id integer,
    employee_name character varying(50),
    salary numeric(10,2)
);
    DROP TABLE public.employees3;
       public         heap r       postgres    false            �           0    0    TABLE employees3    ACL     2   GRANT ALL ON TABLE public.employees3 TO new_user;
          public               postgres    false    244            �            1259    33898    friends    TABLE     G   CREATE TABLE public.friends (
    id integer,
    friend_id integer
);
    DROP TABLE public.friends;
       public         heap r       postgres    false            �           0    0    TABLE friends    ACL     /   GRANT ALL ON TABLE public.friends TO new_user;
          public               postgres    false    219            �            1259    33904 	   functions    TABLE     @   CREATE TABLE public.functions (
    x integer,
    y integer
);
    DROP TABLE public.functions;
       public         heap r       postgres    false            �           0    0    TABLE functions    ACL     1   GRANT ALL ON TABLE public.functions TO new_user;
          public               postgres    false    221            �            1259    33922    hackers    TABLE     W   CREATE TABLE public.hackers (
    hacker_id integer,
    name character varying(50)
);
    DROP TABLE public.hackers;
       public         heap r       postgres    false            �           0    0    TABLE hackers    ACL     /   GRANT ALL ON TABLE public.hackers TO new_user;
          public               postgres    false    227            �            1259    33960    job_family_cost    TABLE     �   CREATE TABLE public.job_family_cost (
    job_family character varying(50),
    country character varying(50),
    cost numeric(10,2)
);
 #   DROP TABLE public.job_family_cost;
       public         heap r       postgres    false            �           0    0    TABLE job_family_cost    ACL     7   GRANT ALL ON TABLE public.job_family_cost TO new_user;
          public               postgres    false    238            �            1259    33945    lead_manager    TABLE     z   CREATE TABLE public.lead_manager (
    lead_manager_code character varying(10),
    company_code character varying(10)
);
     DROP TABLE public.lead_manager;
       public         heap r       postgres    false            �           0    0    TABLE lead_manager    ACL     4   GRANT ALL ON TABLE public.lead_manager TO new_user;
          public               postgres    false    234            �            1259    33951    manager    TABLE     �   CREATE TABLE public.manager (
    manager_code character varying(10),
    senior_manager_code character varying(10),
    lead_manager_code character varying(10),
    company_code character varying(10)
);
    DROP TABLE public.manager;
       public         heap r       postgres    false            �           0    0    TABLE manager    ACL     /   GRANT ALL ON TABLE public.manager TO new_user;
          public               postgres    false    236            �            1259    33931    numbers    TABLE     9   CREATE TABLE public.numbers (
    num bigint NOT NULL
);
    DROP TABLE public.numbers;
       public         heap r       postgres    false            �           0    0    TABLE numbers    ACL     /   GRANT ALL ON TABLE public.numbers TO new_user;
          public               postgres    false    230            �            1259    33936    occupations    TABLE     j   CREATE TABLE public.occupations (
    name character varying(50),
    occupation character varying(20)
);
    DROP TABLE public.occupations;
       public         heap r       postgres    false            �           0    0    TABLE occupations    ACL     3   GRANT ALL ON TABLE public.occupations TO new_user;
          public               postgres    false    231            �            1259    33901    packages    TABLE     K   CREATE TABLE public.packages (
    id integer,
    salary numeric(10,2)
);
    DROP TABLE public.packages;
       public         heap r       postgres    false            �           0    0    TABLE packages    ACL     0   GRANT ALL ON TABLE public.packages TO new_user;
          public               postgres    false    220            �            1259    33890    projects    TABLE     g   CREATE TABLE public.projects (
    task_id integer NOT NULL,
    start_date date,
    end_date date
);
    DROP TABLE public.projects;
       public         heap r       postgres    false            �           0    0    TABLE projects    ACL     0   GRANT ALL ON TABLE public.projects TO new_user;
          public               postgres    false    217            �            1259    33948    senior_manager    TABLE     �   CREATE TABLE public.senior_manager (
    senior_manager_code character varying(10),
    lead_manager_code character varying(10),
    company_code character varying(10)
);
 "   DROP TABLE public.senior_manager;
       public         heap r       postgres    false            �           0    0    TABLE senior_manager    ACL     6   GRANT ALL ON TABLE public.senior_manager TO new_user;
          public               postgres    false    235            �            1259    33992    source_table    TABLE     �   CREATE TABLE public.source_table (
    id integer,
    name character varying(50),
    email character varying(100),
    created_date date
);
     DROP TABLE public.source_table;
       public         heap r       postgres    false            �           0    0    TABLE source_table    ACL     4   GRANT ALL ON TABLE public.source_table TO new_user;
          public               postgres    false    245            �            1259    33928    station    TABLE     �   CREATE TABLE public.station (
    id bigint,
    city character varying(21),
    state character varying(2),
    lat_n bigint,
    long_w bigint
);
    DROP TABLE public.station;
       public         heap r       postgres    false            �           0    0    TABLE station    ACL     /   GRANT ALL ON TABLE public.station TO new_user;
          public               postgres    false    229            �            1259    33895    students    TABLE     Q   CREATE TABLE public.students (
    id integer,
    name character varying(50)
);
    DROP TABLE public.students;
       public         heap r       postgres    false            �           0    0    TABLE students    ACL     0   GRANT ALL ON TABLE public.students TO new_user;
          public               postgres    false    218            �            1259    33919    submission_stats    TABLE     �   CREATE TABLE public.submission_stats (
    challenge_id integer,
    total_submissions integer,
    total_accepted_submissions integer
);
 $   DROP TABLE public.submission_stats;
       public         heap r       postgres    false            �           0    0    TABLE submission_stats    ACL     8   GRANT ALL ON TABLE public.submission_stats TO new_user;
          public               postgres    false    226            �            1259    33925    submissions    TABLE     �   CREATE TABLE public.submissions (
    submission_date date,
    submission_id integer,
    hacker_id integer,
    score integer
);
    DROP TABLE public.submissions;
       public         heap r       postgres    false            �           0    0    TABLE submissions    ACL     3   GRANT ALL ON TABLE public.submissions TO new_user;
          public               postgres    false    228            �            1259    33995    target_table    TABLE     �   CREATE TABLE public.target_table (
    id integer,
    name character varying(50),
    email character varying(100),
    created_date date
);
     DROP TABLE public.target_table;
       public         heap r       postgres    false            �           0    0    TABLE target_table    ACL     4   GRANT ALL ON TABLE public.target_table TO new_user;
          public               postgres    false    246            �            1259    33981 
   test_table    TABLE     _   CREATE TABLE public.test_table (
    id integer,
    column_a integer,
    column_b integer
);
    DROP TABLE public.test_table;
       public         heap r       postgres    false            �           0    0    TABLE test_table    ACL     2   GRANT ALL ON TABLE public.test_table TO new_user;
          public               postgres    false    242            �            1259    33916 
   view_stats    TABLE     v   CREATE TABLE public.view_stats (
    challenge_id integer,
    total_views integer,
    total_unique_views integer
);
    DROP TABLE public.view_stats;
       public         heap r       postgres    false            �           0    0    TABLE view_stats    ACL     2   GRANT ALL ON TABLE public.view_stats TO new_user;
          public               postgres    false    225            �          0    33939    bst 
   TABLE DATA           #   COPY public.bst (n, p) FROM stdin;
    public               postgres    false    232   �X       �          0    33963    bu_monthly_data 
   TABLE DATA           ?   COPY public.bu_monthly_data (month, cost, revenue) FROM stdin;
    public               postgres    false    239   �X       �          0    33913 
   challenges 
   TABLE DATA           >   COPY public.challenges (challenge_id, college_id) FROM stdin;
    public               postgres    false    224   Y       �          0    33910    colleges 
   TABLE DATA           :   COPY public.colleges (college_id, contest_id) FROM stdin;
    public               postgres    false    223   [Y       �          0    33942    company 
   TABLE DATA           8   COPY public.company (company_code, founder) FROM stdin;
    public               postgres    false    233   �Y       �          0    33907    contests 
   TABLE DATA           ?   COPY public.contests (contest_id, hacker_id, name) FROM stdin;
    public               postgres    false    222   �Y       �          0    33954    employee 
   TABLE DATA           u   COPY public.employee (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) FROM stdin;
    public               postgres    false    237    Z       �          0    33986    employee_cost 
   TABLE DATA           _   COPY public.employee_cost (employee_id, employee_name, cost, month, bu, weightage) FROM stdin;
    public               postgres    false    243   cZ       �          0    33966 	   employees 
   TABLE DATA           F   COPY public.employees (employee_id, sub_band, department) FROM stdin;
    public               postgres    false    240   H[       �          0    33969 
   employees2 
   TABLE DATA           T   COPY public.employees2 (employee_id, employee_name, salary, department) FROM stdin;
    public               postgres    false    241   �[       �          0    33989 
   employees3 
   TABLE DATA           H   COPY public.employees3 (employee_id, employee_name, salary) FROM stdin;
    public               postgres    false    244   �\       �          0    33898    friends 
   TABLE DATA           0   COPY public.friends (id, friend_id) FROM stdin;
    public               postgres    false    219   @]       �          0    33904 	   functions 
   TABLE DATA           )   COPY public.functions (x, y) FROM stdin;
    public               postgres    false    221   m]       �          0    33922    hackers 
   TABLE DATA           2   COPY public.hackers (hacker_id, name) FROM stdin;
    public               postgres    false    227   �]       �          0    33960    job_family_cost 
   TABLE DATA           D   COPY public.job_family_cost (job_family, country, cost) FROM stdin;
    public               postgres    false    238   ^       �          0    33945    lead_manager 
   TABLE DATA           G   COPY public.lead_manager (lead_manager_code, company_code) FROM stdin;
    public               postgres    false    234   �^       �          0    33951    manager 
   TABLE DATA           e   COPY public.manager (manager_code, senior_manager_code, lead_manager_code, company_code) FROM stdin;
    public               postgres    false    236   �^       �          0    33931    numbers 
   TABLE DATA           &   COPY public.numbers (num) FROM stdin;
    public               postgres    false    230   �^       �          0    33936    occupations 
   TABLE DATA           7   COPY public.occupations (name, occupation) FROM stdin;
    public               postgres    false    231   +f       �          0    33901    packages 
   TABLE DATA           .   COPY public.packages (id, salary) FROM stdin;
    public               postgres    false    220   �f       �          0    33890    projects 
   TABLE DATA           A   COPY public.projects (task_id, start_date, end_date) FROM stdin;
    public               postgres    false    217   �f       �          0    33948    senior_manager 
   TABLE DATA           ^   COPY public.senior_manager (senior_manager_code, lead_manager_code, company_code) FROM stdin;
    public               postgres    false    235   /g       �          0    33992    source_table 
   TABLE DATA           E   COPY public.source_table (id, name, email, created_date) FROM stdin;
    public               postgres    false    245   bg       �          0    33928    station 
   TABLE DATA           A   COPY public.station (id, city, state, lat_n, long_w) FROM stdin;
    public               postgres    false    229   �g       �          0    33895    students 
   TABLE DATA           ,   COPY public.students (id, name) FROM stdin;
    public               postgres    false    218   �h       �          0    33919    submission_stats 
   TABLE DATA           g   COPY public.submission_stats (challenge_id, total_submissions, total_accepted_submissions) FROM stdin;
    public               postgres    false    226   )i       �          0    33925    submissions 
   TABLE DATA           W   COPY public.submissions (submission_date, submission_id, hacker_id, score) FROM stdin;
    public               postgres    false    228   i       �          0    33995    target_table 
   TABLE DATA           E   COPY public.target_table (id, name, email, created_date) FROM stdin;
    public               postgres    false    246   Hj       �          0    33981 
   test_table 
   TABLE DATA           <   COPY public.test_table (id, column_a, column_b) FROM stdin;
    public               postgres    false    242   �j       �          0    33916 
   view_stats 
   TABLE DATA           S   COPY public.view_stats (challenge_id, total_views, total_unique_views) FROM stdin;
    public               postgres    false    225   �j       �           2606    33935    numbers numbers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.numbers
    ADD CONSTRAINT numbers_pkey PRIMARY KEY (num);
 >   ALTER TABLE ONLY public.numbers DROP CONSTRAINT numbers_pkey;
       public                 postgres    false    230            �           2606    33894    projects projects_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (task_id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public                 postgres    false    217            o           826    33985    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ]   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO new_user;
          public               postgres    false            �   %   x�3�4�2b3N.K 6�4� bS�?�=... L��      �   H   x��J�+M,��44 =NCS(��-5�"i���I�&%gp�e�L�2�E�9���0#��\1z\\\ ���      �   4   x�-Ʊ !�:��$&���ߠJ<�
R�)���(���8��O�~ ~��	"      �   /   x�3442��43310�26217�MM͸L��,L9-M,�,�b���� ��      �   #   x�s6������N�r6�N�M�+�H����� l�D      �   C   x�33310�44�47��/N�23355�4�445�t�KO�I�4�0��0027�t+J������� �k      �   3   x�s5��5�b v6�r5B0��5
�8���\M8�$�=... d~      �   �   x�}��N�0 ��y���H�7����Vi.f�HD�H� �����@������6GQ�>�#x"�D�ey�2B�Qr�_G �	+�s��!4��Ly\�.��)�S��+�k���S7�;�H��~/�?o-����9�Z�FW�5<���ZN���_[���W�\����~�n
㟿X��a5�I�4vAm��%���\�8������H{o      �   P   x�3��*���/�t�K��KM-��K�2�N�4���M,�N-	�p�f��(2��N�I-�2+@h0�����fO� ܙ0�      �   �   x�m�MO�@���b>����4.�ċ�	�tB;��~z�����2Ͽ�:6Fu��a�y���D��эQs�z���h��$�L�Փ�]��2��[�n�e���]3�[3���h���+5���96��v��]P�+(��=r�+#L~,̘��J�Uy���}�4ӎ/mL�?��Z��MmD�<=�בs�o�]�      �   �   x�5��
�0����S�Hj�M��DW
n��`;�T���R���;�����<lm��SLq�āF��M3T8���2ŷ���ΰ�h�/���/5�p��������KϴЛO��2C�S�h��*[�j�Pe:pz��\��a��t⡍	v�{i��r����ú�IQ_K>�      �      x�3�4�2�4�2�4�2�4����� ��      �   '   x�32�42�2���\FƜFF\FF�F�\F� �=... |�      �   k   x����0���cP��a`$��b���TJY��=�R��\�
v�	���6�D)�.C�ɜ=�?l�Ὃ�n�*��$t�߻��!r�B�w�H%1�ݦ�ֆ���#�      �   W   x�s�K��KM-��K���K�L�45 =.W$��`GNC#��obQvj	B�	�D�7�L481'���E�=�(71����6F��� �a(�      �      x���5�t6���5�t6����� %�M      �   (   x��5��5��bgC._# ��3�t6���x1z\\\ ��      �   2  x��A�!�;��h$���Nͽ"��AR�k�Q�;ޘߘs�3�\c�1k�3���F�1"G�{D�8#�7�9G���F�5�#�X�Xs�˿���c�Xg�;��{�c���C{���}�~��QsT��Qk��o�:��7�7�'��q�8{�����Ɲ�Ƹ9�w�[��k�o�o�9^�����x5�O݆:>}|
�4���ɧ�O+�Z>�_mr]\7��uw]^����o*pF�+�éĩũƩǩȩɩʩ˙!�ΩϩЩѩҩөԩթֹZLN�S�S�S�S�S�S�S�S�s7�������������������g�7 �������������y�c�S���T���T���0	L��W%Gab�&�Ib��,&�Ic��������#x��<�G������<�G��#�{���E��7�u��Y�w�6��<"�ӗ�<�G��#x���#r<�G��#x��<b��I�G��#x��<�GT���x��<�G��#x�韧��<�G��#x���;��<�G��#x���������<�G�H�#y$�䑳�9�#y$��<�G�H����H�#y$�����S�o�ﱑ��ߛ~p���'�G�H�#W�Jr<�G�H�#y$��<r��%�#y$��<�G�H�#��99�#y$��<�G�Hy�A��<�G�H�#y$�䑷_N9�#y$��<�G�H����7�#�c�X<��c�X<��c�~��x,���x,���x��W[���x,���x,���~��x,���x��=z
�����=
z�0�x,���v9���x,���x,�z���X<��c�X<��c�X�G���c�X<��c�X<�u{V��X<��c�X<��c�X��ZO5c���yl���yl�Ǟ=��xl���yl���y��9)�c��<6��c��<6��cgT9���yl���yl{���yl�������s�п-�C��t�i���yl�Ǯ��r<6��c��<6��c��<��/�c��<6��c��<6��c���xl���yl���y��kD�	ţx��Q<�G�(5{��Q<�G�(ţx��Qћ���Q<�G�(ţx��^a�x��Q<�G�(ţx��]G�G�(ţx��Q<�G�^��x��Q�7��ԛS�N�;���۞�z��G�(ţx��Q��,9ţx��Q<�G�(u{��Q<�G�(ţx��Q���ܬn<����8<����8<��O���qx���qx�ǉ��x���qx���qx��Q���qx���qx��Y�]��8<����8<����8��P9���qx���qx�z_��qx��h{�흶���j{��������j���8<����8<�s{��qx���qx���q^�ʽ+[�y\���qy\���qy��K�����<.����<.��}��<.����<.�����k�����<.����<.��z���qy\���qy\���qw/�r<.����<.����<n�� ���<.����<.���>%�xܾ5���k�ύ�7��苣O���!���<.����<.���>N�:q��x<����x<����x��9����x<����x</�ޑ��x<����x<����#9����x<����x<o�%���x<����x<����>��x<����x<����x��L����x<����x<��;}���x<����x<����x��<����;�����[��������ƿ�1��6z�      �   i   x�M��
�0D�ُ�DO!�k/K�6��f{��W��������;�%vsyZQ�-�O^Yo�]���X�悖j=�f}���j�t�g�%�i�Ǡ��͏����2�      �   *   x��A 1��Ɠu�Cs�qTBl:����#Ȯ�h���~mf�      �   A   x�Mȹ�@���<��.�B�u�Y��/7֢-����@(٠>5�,�?���$��:�      �   #   x��5��bgC�`_#��4�t6����� ��/      �   q   x�e�1
�0��z��@$Y������M"#&O����_�3��YMp!�x6�$��N�mO��堖�Ga��fC-F����$Ë��V[C~g܂��d��UX����ذ-{      �   �   x�M��N�0�ϳO�'@�O�s�RU��B%����)Vc�dQ� ���ⲇ���f:��9�xEw�0�$ZN�z����JCK
M��¸k�%�%�=�i���P��J{�C�A���۬���}��ñ�.`J2xpC&��K��PY���>��b�����ҊR��b58��g �$!P�Nᯓ%!qp�k��+��k���^����)��_�F�q�x���KY�H��7F�&���*a���/̩PZ      �   3   x�3�t,��I��2�N�M�+�H�2��*��L�2�NN,�I-����� ?      �   F   x�5��	�0��0�r��ݥ��Q����q�M����DO��P1W���\��i7�� �o
ߋ�<�      �   �   x�m�Qr�0C��]�����.��9�N��x�_����zy�|�b��������F�a#7]i�'`��	z�6/l��F`M�3׶F��S���� �Im�i����B�2�-�X(|hF`D�B�Z�hȳ�ږ��x[x!�+q��R?X��kZ!�}96��^'ᅔ�o����8�ߎ]       �   q   x�e�1
�0��z��@$Y������M"#&O����_�3��YMp!�x6�$��N�mO��堖�Ga��fC-F����$Ë��V[C~g܂��d��UX����ذ-{      �   %   x�3�42�44�2�41�46�2�43�45������ <�      �   I   x�-���0Cѳ=�Ӥ��������K+�X�f������
9�q�M�J���F���c;��u�ۈ�E�K
'     