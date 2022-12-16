PGDMP         (                z         
   Restaurant    14.5    14.5 M    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    16861 
   Restaurant    DATABASE     i   CREATE DATABASE "Restaurant" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "Restaurant";
                postgres    false            �            1259    17222    beveragelist    TABLE     �   CREATE TABLE public.beveragelist (
    beverageid integer NOT NULL,
    beveragename character varying NOT NULL,
    beverageprice real NOT NULL
);
     DROP TABLE public.beveragelist;
       public         heap    postgres    false            �            1259    17221    beveragelist_beverageid_seq    SEQUENCE     �   CREATE SEQUENCE public.beveragelist_beverageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.beveragelist_beverageid_seq;
       public          postgres    false    226            ^           0    0    beveragelist_beverageid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.beveragelist_beverageid_seq OWNED BY public.beveragelist.beverageid;
          public          postgres    false    225            �            1259    17130 	   beverages    TABLE     �   CREATE TABLE public.beverages (
    beverageid integer NOT NULL,
    beveragename character varying(100) NOT NULL,
    beverageprice real NOT NULL,
    orderid integer NOT NULL
);
    DROP TABLE public.beverages;
       public         heap    postgres    false            �            1259    17129    beverages_beverageid_seq    SEQUENCE     �   CREATE SEQUENCE public.beverages_beverageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.beverages_beverageid_seq;
       public          postgres    false    222            _           0    0    beverages_beverageid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.beverages_beverageid_seq OWNED BY public.beverages.beverageid;
          public          postgres    false    221            �            1259    16985    cashier    TABLE     >   CREATE TABLE public.cashier (
    staffid integer NOT NULL
);
    DROP TABLE public.cashier;
       public         heap    postgres    false            �            1259    17102    checkout    TABLE     m   CREATE TABLE public.checkout (
    sectionid integer NOT NULL,
    cashierid integer,
    orderid integer
);
    DROP TABLE public.checkout;
       public         heap    postgres    false            �            1259    17005    courier    TABLE     >   CREATE TABLE public.courier (
    staffid integer NOT NULL
);
    DROP TABLE public.courier;
       public         heap    postgres    false            �            1259    17215    foodlist    TABLE     �   CREATE TABLE public.foodlist (
    foodid integer NOT NULL,
    foodname character varying(100) NOT NULL,
    foodprice real NOT NULL
);
    DROP TABLE public.foodlist;
       public         heap    postgres    false            �            1259    17214    foodlist_foodid_seq    SEQUENCE     �   CREATE SEQUENCE public.foodlist_foodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.foodlist_foodid_seq;
       public          postgres    false    224            `           0    0    foodlist_foodid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.foodlist_foodid_seq OWNED BY public.foodlist.foodid;
          public          postgres    false    223            �            1259    17123    foods    TABLE     �   CREATE TABLE public.foods (
    foodid integer NOT NULL,
    foodname character varying(100) NOT NULL,
    foodprice real NOT NULL,
    orderid integer NOT NULL
);
    DROP TABLE public.foods;
       public         heap    postgres    false            �            1259    17122    foods_foodid_seq    SEQUENCE     �   CREATE SEQUENCE public.foods_foodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.foods_foodid_seq;
       public          postgres    false    220            a           0    0    foods_foodid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.foods_foodid_seq OWNED BY public.foods.foodid;
          public          postgres    false    219            �            1259    17027    kitchen    TABLE     U   CREATE TABLE public.kitchen (
    sectionid integer NOT NULL,
    orderid integer
);
    DROP TABLE public.kitchen;
       public         heap    postgres    false            �            1259    17016    order    TABLE     �   CREATE TABLE public."order" (
    orderid integer NOT NULL,
    orderaddress character varying(300),
    totalprice real,
    staffid integer,
    tableid integer NOT NULL
);
    DROP TABLE public."order";
       public         heap    postgres    false            �            1259    17015    order_orderid_seq    SEQUENCE     �   CREATE SEQUENCE public.order_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.order_orderid_seq;
       public          postgres    false    215            b           0    0    order_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_orderid_seq OWNED BY public."order".orderid;
          public          postgres    false    214            �            1259    16957    staff    TABLE     �   CREATE TABLE public.staff (
    staffid integer NOT NULL,
    stafftype character varying(50) NOT NULL,
    staffname character varying,
    staffphoneno character(11)
);
    DROP TABLE public.staff;
       public         heap    postgres    false            �            1259    16956    staff_staffid_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_staffid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.staff_staffid_seq;
       public          postgres    false    210            c           0    0    staff_staffid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.staff_staffid_seq OWNED BY public.staff.staffid;
          public          postgres    false    209            �            1259    17062    tables    TABLE     =   CREATE TABLE public.tables (
    tableid integer NOT NULL
);
    DROP TABLE public.tables;
       public         heap    postgres    false            �            1259    16995    waiter    TABLE     =   CREATE TABLE public.waiter (
    staffid integer NOT NULL
);
    DROP TABLE public.waiter;
       public         heap    postgres    false            �           2604    17225    beveragelist beverageid    DEFAULT     �   ALTER TABLE ONLY public.beveragelist ALTER COLUMN beverageid SET DEFAULT nextval('public.beveragelist_beverageid_seq'::regclass);
 F   ALTER TABLE public.beveragelist ALTER COLUMN beverageid DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    17133    beverages beverageid    DEFAULT     |   ALTER TABLE ONLY public.beverages ALTER COLUMN beverageid SET DEFAULT nextval('public.beverages_beverageid_seq'::regclass);
 C   ALTER TABLE public.beverages ALTER COLUMN beverageid DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    17218    foodlist foodid    DEFAULT     r   ALTER TABLE ONLY public.foodlist ALTER COLUMN foodid SET DEFAULT nextval('public.foodlist_foodid_seq'::regclass);
 >   ALTER TABLE public.foodlist ALTER COLUMN foodid DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    17126    foods foodid    DEFAULT     l   ALTER TABLE ONLY public.foods ALTER COLUMN foodid SET DEFAULT nextval('public.foods_foodid_seq'::regclass);
 ;   ALTER TABLE public.foods ALTER COLUMN foodid DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    17019    order orderid    DEFAULT     p   ALTER TABLE ONLY public."order" ALTER COLUMN orderid SET DEFAULT nextval('public.order_orderid_seq'::regclass);
 >   ALTER TABLE public."order" ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16960    staff staffid    DEFAULT     n   ALTER TABLE ONLY public.staff ALTER COLUMN staffid SET DEFAULT nextval('public.staff_staffid_seq'::regclass);
 <   ALTER TABLE public.staff ALTER COLUMN staffid DROP DEFAULT;
       public          postgres    false    209    210    210            W          0    17222    beveragelist 
   TABLE DATA           O   COPY public.beveragelist (beverageid, beveragename, beverageprice) FROM stdin;
    public          postgres    false    226   �T       S          0    17130 	   beverages 
   TABLE DATA           U   COPY public.beverages (beverageid, beveragename, beverageprice, orderid) FROM stdin;
    public          postgres    false    222   �T       H          0    16985    cashier 
   TABLE DATA           *   COPY public.cashier (staffid) FROM stdin;
    public          postgres    false    211   `U       O          0    17102    checkout 
   TABLE DATA           A   COPY public.checkout (sectionid, cashierid, orderid) FROM stdin;
    public          postgres    false    218   �U       J          0    17005    courier 
   TABLE DATA           *   COPY public.courier (staffid) FROM stdin;
    public          postgres    false    213   �U       U          0    17215    foodlist 
   TABLE DATA           ?   COPY public.foodlist (foodid, foodname, foodprice) FROM stdin;
    public          postgres    false    224   �U       Q          0    17123    foods 
   TABLE DATA           E   COPY public.foods (foodid, foodname, foodprice, orderid) FROM stdin;
    public          postgres    false    220   /V       M          0    17027    kitchen 
   TABLE DATA           5   COPY public.kitchen (sectionid, orderid) FROM stdin;
    public          postgres    false    216   �V       L          0    17016    order 
   TABLE DATA           V   COPY public."order" (orderid, orderaddress, totalprice, staffid, tableid) FROM stdin;
    public          postgres    false    215   �V       G          0    16957    staff 
   TABLE DATA           L   COPY public.staff (staffid, stafftype, staffname, staffphoneno) FROM stdin;
    public          postgres    false    210   .W       N          0    17062    tables 
   TABLE DATA           )   COPY public.tables (tableid) FROM stdin;
    public          postgres    false    217   �W       I          0    16995    waiter 
   TABLE DATA           )   COPY public.waiter (staffid) FROM stdin;
    public          postgres    false    212   �W       d           0    0    beveragelist_beverageid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.beveragelist_beverageid_seq', 7, true);
          public          postgres    false    225            e           0    0    beverages_beverageid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.beverages_beverageid_seq', 98, true);
          public          postgres    false    221            f           0    0    foodlist_foodid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.foodlist_foodid_seq', 8, true);
          public          postgres    false    223            g           0    0    foods_foodid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.foods_foodid_seq', 93, true);
          public          postgres    false    219            h           0    0    order_orderid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_orderid_seq', 110, true);
          public          postgres    false    214            i           0    0    staff_staffid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.staff_staffid_seq', 8, true);
          public          postgres    false    209            �           2606    17392    beveragelist beveragelistpk 
   CONSTRAINT     a   ALTER TABLE ONLY public.beveragelist
    ADD CONSTRAINT beveragelistpk PRIMARY KEY (beverageid);
 E   ALTER TABLE ONLY public.beveragelist DROP CONSTRAINT beveragelistpk;
       public            postgres    false    226            �           2606    17135    beverages beveragespk 
   CONSTRAINT     [   ALTER TABLE ONLY public.beverages
    ADD CONSTRAINT beveragespk PRIMARY KEY (beverageid);
 ?   ALTER TABLE ONLY public.beverages DROP CONSTRAINT beveragespk;
       public            postgres    false    222            �           2606    16989    cashier cashierpk 
   CONSTRAINT     T   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierpk PRIMARY KEY (staffid);
 ;   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashierpk;
       public            postgres    false    211            �           2606    17106    checkout checkoutpk 
   CONSTRAINT     X   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutpk PRIMARY KEY (sectionid);
 =   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutpk;
       public            postgres    false    218            �           2606    17009    courier courierpk 
   CONSTRAINT     T   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierpk PRIMARY KEY (staffid);
 ;   ALTER TABLE ONLY public.courier DROP CONSTRAINT courierpk;
       public            postgres    false    213            �           2606    17390    foodlist foodlistpk 
   CONSTRAINT     U   ALTER TABLE ONLY public.foodlist
    ADD CONSTRAINT foodlistpk PRIMARY KEY (foodid);
 =   ALTER TABLE ONLY public.foodlist DROP CONSTRAINT foodlistpk;
       public            postgres    false    224            �           2606    17128    foods foodspk 
   CONSTRAINT     O   ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foodspk PRIMARY KEY (foodid);
 7   ALTER TABLE ONLY public.foods DROP CONSTRAINT foodspk;
       public            postgres    false    220            �           2606    17031    kitchen kitchenpk 
   CONSTRAINT     V   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenpk PRIMARY KEY (sectionid);
 ;   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenpk;
       public            postgres    false    216            �           2606    17021    order orderpk 
   CONSTRAINT     R   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderpk PRIMARY KEY (orderid);
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderpk;
       public            postgres    false    215            �           2606    16962    staff staffpk 
   CONSTRAINT     P   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staffpk PRIMARY KEY (staffid);
 7   ALTER TABLE ONLY public.staff DROP CONSTRAINT staffpk;
       public            postgres    false    210            �           2606    17383    tables tablespk 
   CONSTRAINT     R   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablespk PRIMARY KEY (tableid);
 9   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablespk;
       public            postgres    false    217            �           2606    17229 +   beveragelist unique_beveragelist_beverageid 
   CONSTRAINT     l   ALTER TABLE ONLY public.beveragelist
    ADD CONSTRAINT unique_beveragelist_beverageid UNIQUE (beverageid);
 U   ALTER TABLE ONLY public.beveragelist DROP CONSTRAINT unique_beveragelist_beverageid;
       public            postgres    false    226            �           2606    17220    foodlist unique_foodlist_foodid 
   CONSTRAINT     \   ALTER TABLE ONLY public.foodlist
    ADD CONSTRAINT unique_foodlist_foodid UNIQUE (foodid);
 I   ALTER TABLE ONLY public.foodlist DROP CONSTRAINT unique_foodlist_foodid;
       public            postgres    false    224            �           2606    17381    tables unique_tables_tableid 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT unique_tables_tableid UNIQUE (tableid);
 F   ALTER TABLE ONLY public.tables DROP CONSTRAINT unique_tables_tableid;
       public            postgres    false    217            �           2606    16999    waiter waiterpk 
   CONSTRAINT     R   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterpk PRIMARY KEY (staffid);
 9   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiterpk;
       public            postgres    false    212            �           2606    17364    beverages beveragesfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.beverages
    ADD CONSTRAINT beveragesfk FOREIGN KEY (orderid) REFERENCES public."order"(orderid) ON UPDATE CASCADE ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.beverages DROP CONSTRAINT beveragesfk;
       public          postgres    false    215    222    3228            �           2606    17273    cashier cashierfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashierfk;
       public          postgres    false    210    3220    211            �           2606    17112    checkout checkoutfk2    FK CONSTRAINT     |   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk2 FOREIGN KEY (cashierid) REFERENCES public.cashier(staffid);
 >   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk2;
       public          postgres    false    3222    218    211            �           2606    17117    checkout checkoutfk3    FK CONSTRAINT     z   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk3 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 >   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk3;
       public          postgres    false    215    3228    218            �           2606    17283    courier courierfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.courier DROP CONSTRAINT courierfk;
       public          postgres    false    213    3220    210            �           2606    17359    foods foodsdk    FK CONSTRAINT     �   ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foodsdk FOREIGN KEY (orderid) REFERENCES public."order"(orderid) ON UPDATE CASCADE ON DELETE CASCADE;
 7   ALTER TABLE ONLY public.foods DROP CONSTRAINT foodsdk;
       public          postgres    false    220    3228    215            �           2606    17037    kitchen kitchenfk2    FK CONSTRAINT     x   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenfk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 <   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenfk2;
       public          postgres    false    215    216    3228            �           2606    17022    order orderfk    FK CONSTRAINT     s   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderfk;
       public          postgres    false    210    215    3220            �           2606    17384    order tablefk    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT tablefk FOREIGN KEY (tableid) REFERENCES public.tables(tableid) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT tablefk;
       public          postgres    false    215    3234    217            �           2606    17278    waiter waiterfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiterfk;
       public          postgres    false    210    212    3220            W   _   x�̱@0��ޯ����M6����R4Q�_�ON�~�=��� �
�ᴋ@��oqM�����,ɧU����N�?���]sJI���      S   _   x�m�=
�0���)<AI��fv��)�������o~Q1��.��C=)��m���9s6C�К�F;Y�[���3�#iDg�y�� "L�#��Bl      H      x�3�2����� �$      O      x������ � �      J      x�3������� �(      U   `   x��A
�0����)I�h�@�b�t3hh��9�}��j�/F�`�5�;�H?��\��0Yk��1"�]�a�߮�c�;+�O��,���A��      Q   ^   x�M�1
�0���H���}@�mm"�("H��7��63��~o�������)f8S�R�/���a.1PWG�1_!m���C��>���siH����      M      x������ � �      L   d   x��=
�0���@$��1�p��R�A���8~�aź��L����ԫ�J=��VxB�p���E�4zP#�D8�	��?u��ɧ`��u ���Q      G   �   x�3�LN,��L-�t���4056"�2�,O�,IT��
�2B0�e̙�_Z��
�ejjdldbjf�e7/2���������F�\�0#O��@#���A�̹,�F:�%f����� ]���� �p-�      N      x�3�2�2�2�2�2�2��2������ "��      I      x�3�2����� �&     