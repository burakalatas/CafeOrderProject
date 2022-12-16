PGDMP     5                    z         
   Restaurant    14.5    14.5 ^    n           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            q           1262    16861 
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
       public          postgres    false    230            r           0    0    beveragelist_beverageid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.beveragelist_beverageid_seq OWNED BY public.beveragelist.beverageid;
          public          postgres    false    229            �            1259    17130 	   beverages    TABLE     �   CREATE TABLE public.beverages (
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
       public          postgres    false    226            s           0    0    beverages_beverageid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.beverages_beverageid_seq OWNED BY public.beverages.beverageid;
          public          postgres    false    225            �            1259    16985    cashier    TABLE     �   CREATE TABLE public.cashier (
    staffid integer NOT NULL,
    cashiername character varying(100),
    cashierphoneno character varying(20)
);
    DROP TABLE public.cashier;
       public         heap    postgres    false            �            1259    17102    checkout    TABLE     m   CREATE TABLE public.checkout (
    sectionid integer NOT NULL,
    cashierid integer,
    orderid integer
);
    DROP TABLE public.checkout;
       public         heap    postgres    false            �            1259    17005    courier    TABLE     �   CREATE TABLE public.courier (
    staffid integer NOT NULL,
    couriername character varying(100),
    courierphoneno character varying(20)
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
       public          postgres    false    228            t           0    0    foodlist_foodid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.foodlist_foodid_seq OWNED BY public.foodlist.foodid;
          public          postgres    false    227            �            1259    17123    foods    TABLE     �   CREATE TABLE public.foods (
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
       public          postgres    false    224            u           0    0    foods_foodid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.foods_foodid_seq OWNED BY public.foods.foodid;
          public          postgres    false    223            �            1259    17027    kitchen    TABLE     U   CREATE TABLE public.kitchen (
    sectionid integer NOT NULL,
    orderid integer
);
    DROP TABLE public.kitchen;
       public         heap    postgres    false            �            1259    17016    order    TABLE     �   CREATE TABLE public."order" (
    orderid integer NOT NULL,
    orderaddress character varying(300),
    totalprice real,
    staffid integer
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
       public          postgres    false    219            v           0    0    order_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_orderid_seq OWNED BY public."order".orderid;
          public          postgres    false    218            �            1259    16964 
   restaurant    TABLE     �   CREATE TABLE public.restaurant (
    restaurantid integer NOT NULL,
    restaurantname character varying(100) NOT NULL,
    restaurantaddress character varying(300) NOT NULL,
    sectionid integer NOT NULL,
    staffid integer
);
    DROP TABLE public.restaurant;
       public         heap    postgres    false            �            1259    16963    restaurant_restaurantid_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_restaurantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.restaurant_restaurantid_seq;
       public          postgres    false    214            w           0    0    restaurant_restaurantid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.restaurant_restaurantid_seq OWNED BY public.restaurant.restaurantid;
          public          postgres    false    213            �            1259    16950    section    TABLE     p   CREATE TABLE public.section (
    sectionid integer NOT NULL,
    sectiontype character varying(50) NOT NULL
);
    DROP TABLE public.section;
       public         heap    postgres    false            �            1259    16949    section_sectionid_seq    SEQUENCE     �   CREATE SEQUENCE public.section_sectionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.section_sectionid_seq;
       public          postgres    false    210            x           0    0    section_sectionid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.section_sectionid_seq OWNED BY public.section.sectionid;
          public          postgres    false    209            �            1259    16957    staff    TABLE     j   CREATE TABLE public.staff (
    staffid integer NOT NULL,
    stafftype character varying(50) NOT NULL
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
       public          postgres    false    212            y           0    0    staff_staffid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.staff_staffid_seq OWNED BY public.staff.staffid;
          public          postgres    false    211            �            1259    17062    tables    TABLE     j   CREATE TABLE public.tables (
    sectionid integer NOT NULL,
    waiterid integer,
    orderid integer
);
    DROP TABLE public.tables;
       public         heap    postgres    false            �            1259    16995    waiter    TABLE     �   CREATE TABLE public.waiter (
    staffid integer NOT NULL,
    waitername character varying(100),
    waiterphoneno character varying(20)
);
    DROP TABLE public.waiter;
       public         heap    postgres    false            �           2604    17225    beveragelist beverageid    DEFAULT     �   ALTER TABLE ONLY public.beveragelist ALTER COLUMN beverageid SET DEFAULT nextval('public.beveragelist_beverageid_seq'::regclass);
 F   ALTER TABLE public.beveragelist ALTER COLUMN beverageid DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    17133    beverages beverageid    DEFAULT     |   ALTER TABLE ONLY public.beverages ALTER COLUMN beverageid SET DEFAULT nextval('public.beverages_beverageid_seq'::regclass);
 C   ALTER TABLE public.beverages ALTER COLUMN beverageid DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    17218    foodlist foodid    DEFAULT     r   ALTER TABLE ONLY public.foodlist ALTER COLUMN foodid SET DEFAULT nextval('public.foodlist_foodid_seq'::regclass);
 >   ALTER TABLE public.foodlist ALTER COLUMN foodid DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    17126    foods foodid    DEFAULT     l   ALTER TABLE ONLY public.foods ALTER COLUMN foodid SET DEFAULT nextval('public.foods_foodid_seq'::regclass);
 ;   ALTER TABLE public.foods ALTER COLUMN foodid DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    17019    order orderid    DEFAULT     p   ALTER TABLE ONLY public."order" ALTER COLUMN orderid SET DEFAULT nextval('public.order_orderid_seq'::regclass);
 >   ALTER TABLE public."order" ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16967    restaurant restaurantid    DEFAULT     �   ALTER TABLE ONLY public.restaurant ALTER COLUMN restaurantid SET DEFAULT nextval('public.restaurant_restaurantid_seq'::regclass);
 F   ALTER TABLE public.restaurant ALTER COLUMN restaurantid DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    16953    section sectionid    DEFAULT     v   ALTER TABLE ONLY public.section ALTER COLUMN sectionid SET DEFAULT nextval('public.section_sectionid_seq'::regclass);
 @   ALTER TABLE public.section ALTER COLUMN sectionid DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    16960    staff staffid    DEFAULT     n   ALTER TABLE ONLY public.staff ALTER COLUMN staffid SET DEFAULT nextval('public.staff_staffid_seq'::regclass);
 <   ALTER TABLE public.staff ALTER COLUMN staffid DROP DEFAULT;
       public          postgres    false    211    212    212            k          0    17222    beveragelist 
   TABLE DATA           O   COPY public.beveragelist (beverageid, beveragename, beverageprice) FROM stdin;
    public          postgres    false    230   Ij       g          0    17130 	   beverages 
   TABLE DATA           U   COPY public.beverages (beverageid, beveragename, beverageprice, orderid) FROM stdin;
    public          postgres    false    226   �j       \          0    16985    cashier 
   TABLE DATA           G   COPY public.cashier (staffid, cashiername, cashierphoneno) FROM stdin;
    public          postgres    false    215    k       c          0    17102    checkout 
   TABLE DATA           A   COPY public.checkout (sectionid, cashierid, orderid) FROM stdin;
    public          postgres    false    222   Kk       ^          0    17005    courier 
   TABLE DATA           G   COPY public.courier (staffid, couriername, courierphoneno) FROM stdin;
    public          postgres    false    217   hk       i          0    17215    foodlist 
   TABLE DATA           ?   COPY public.foodlist (foodid, foodname, foodprice) FROM stdin;
    public          postgres    false    228   �k       e          0    17123    foods 
   TABLE DATA           E   COPY public.foods (foodid, foodname, foodprice, orderid) FROM stdin;
    public          postgres    false    224   l       a          0    17027    kitchen 
   TABLE DATA           5   COPY public.kitchen (sectionid, orderid) FROM stdin;
    public          postgres    false    220   Cl       `          0    17016    order 
   TABLE DATA           M   COPY public."order" (orderid, orderaddress, totalprice, staffid) FROM stdin;
    public          postgres    false    219   `l       [          0    16964 
   restaurant 
   TABLE DATA           i   COPY public.restaurant (restaurantid, restaurantname, restaurantaddress, sectionid, staffid) FROM stdin;
    public          postgres    false    214   �l       W          0    16950    section 
   TABLE DATA           9   COPY public.section (sectionid, sectiontype) FROM stdin;
    public          postgres    false    210   �l       Y          0    16957    staff 
   TABLE DATA           3   COPY public.staff (staffid, stafftype) FROM stdin;
    public          postgres    false    212   %m       b          0    17062    tables 
   TABLE DATA           >   COPY public.tables (sectionid, waiterid, orderid) FROM stdin;
    public          postgres    false    221   [m       ]          0    16995    waiter 
   TABLE DATA           D   COPY public.waiter (staffid, waitername, waiterphoneno) FROM stdin;
    public          postgres    false    216   xm       z           0    0    beveragelist_beverageid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.beveragelist_beverageid_seq', 7, true);
          public          postgres    false    229            {           0    0    beverages_beverageid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.beverages_beverageid_seq', 72, true);
          public          postgres    false    225            |           0    0    foodlist_foodid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.foodlist_foodid_seq', 8, true);
          public          postgres    false    227            }           0    0    foods_foodid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.foods_foodid_seq', 67, true);
          public          postgres    false    223            ~           0    0    order_orderid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_orderid_seq', 72, true);
          public          postgres    false    218                       0    0    restaurant_restaurantid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.restaurant_restaurantid_seq', 3, true);
          public          postgres    false    213            �           0    0    section_sectionid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.section_sectionid_seq', 3, true);
          public          postgres    false    209            �           0    0    staff_staffid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.staff_staffid_seq', 4, true);
          public          postgres    false    211            �           2606    17135    beverages beveragespk 
   CONSTRAINT     [   ALTER TABLE ONLY public.beverages
    ADD CONSTRAINT beveragespk PRIMARY KEY (beverageid);
 ?   ALTER TABLE ONLY public.beverages DROP CONSTRAINT beveragespk;
       public            postgres    false    226            �           2606    16989    cashier cashierpk 
   CONSTRAINT     T   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierpk PRIMARY KEY (staffid);
 ;   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashierpk;
       public            postgres    false    215            �           2606    17106    checkout checkoutpk 
   CONSTRAINT     X   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutpk PRIMARY KEY (sectionid);
 =   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutpk;
       public            postgres    false    222            �           2606    17009    courier courierpk 
   CONSTRAINT     T   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierpk PRIMARY KEY (staffid);
 ;   ALTER TABLE ONLY public.courier DROP CONSTRAINT courierpk;
       public            postgres    false    217            �           2606    17128    foods foodspk 
   CONSTRAINT     O   ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foodspk PRIMARY KEY (foodid);
 7   ALTER TABLE ONLY public.foods DROP CONSTRAINT foodspk;
       public            postgres    false    224            �           2606    17031    kitchen kitchenpk 
   CONSTRAINT     V   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenpk PRIMARY KEY (sectionid);
 ;   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenpk;
       public            postgres    false    220            �           2606    17021    order orderpk 
   CONSTRAINT     R   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderpk PRIMARY KEY (orderid);
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderpk;
       public            postgres    false    219            �           2606    16969    restaurant restaurantpk 
   CONSTRAINT     _   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurantpk PRIMARY KEY (restaurantid);
 A   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT restaurantpk;
       public            postgres    false    214            �           2606    16955    section sectionpk 
   CONSTRAINT     V   ALTER TABLE ONLY public.section
    ADD CONSTRAINT sectionpk PRIMARY KEY (sectionid);
 ;   ALTER TABLE ONLY public.section DROP CONSTRAINT sectionpk;
       public            postgres    false    210            �           2606    16962    staff staffpk 
   CONSTRAINT     P   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staffpk PRIMARY KEY (staffid);
 7   ALTER TABLE ONLY public.staff DROP CONSTRAINT staffpk;
       public            postgres    false    212            �           2606    17066    tables tablepk 
   CONSTRAINT     S   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablepk PRIMARY KEY (sectionid);
 8   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablepk;
       public            postgres    false    221            �           2606    17229 +   beveragelist unique_beveragelist_beverageid 
   CONSTRAINT     l   ALTER TABLE ONLY public.beveragelist
    ADD CONSTRAINT unique_beveragelist_beverageid UNIQUE (beverageid);
 U   ALTER TABLE ONLY public.beveragelist DROP CONSTRAINT unique_beveragelist_beverageid;
       public            postgres    false    230            �           2606    17220    foodlist unique_foodlist_foodid 
   CONSTRAINT     \   ALTER TABLE ONLY public.foodlist
    ADD CONSTRAINT unique_foodlist_foodid UNIQUE (foodid);
 I   ALTER TABLE ONLY public.foodlist DROP CONSTRAINT unique_foodlist_foodid;
       public            postgres    false    228            �           2606    16999    waiter waiterpk 
   CONSTRAINT     R   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterpk PRIMARY KEY (staffid);
 9   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiterpk;
       public            postgres    false    216            �           2606    17364    beverages beveragesfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.beverages
    ADD CONSTRAINT beveragesfk FOREIGN KEY (orderid) REFERENCES public."order"(orderid) ON UPDATE CASCADE ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.beverages DROP CONSTRAINT beveragesfk;
       public          postgres    false    226    219    3244            �           2606    17273    cashier cashierfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashierfk;
       public          postgres    false    215    3234    212            �           2606    17268    checkout checkout    FK CONSTRAINT     �   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkout FOREIGN KEY (sectionid) REFERENCES public.section(sectionid) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkout;
       public          postgres    false    3232    222    210            �           2606    17112    checkout checkoutfk2    FK CONSTRAINT     |   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk2 FOREIGN KEY (cashierid) REFERENCES public.cashier(staffid);
 >   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk2;
       public          postgres    false    222    215    3238            �           2606    17117    checkout checkoutfk3    FK CONSTRAINT     z   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk3 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 >   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk3;
       public          postgres    false    222    219    3244            �           2606    17283    courier courierfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.courier DROP CONSTRAINT courierfk;
       public          postgres    false    212    217    3234            �           2606    17359    foods foodsdk    FK CONSTRAINT     �   ALTER TABLE ONLY public.foods
    ADD CONSTRAINT foodsdk FOREIGN KEY (orderid) REFERENCES public."order"(orderid) ON UPDATE CASCADE ON DELETE CASCADE;
 7   ALTER TABLE ONLY public.foods DROP CONSTRAINT foodsdk;
       public          postgres    false    224    219    3244            �           2606    17258    kitchen kitchenfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenfk FOREIGN KEY (sectionid) REFERENCES public.section(sectionid) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenfk;
       public          postgres    false    210    220    3232            �           2606    17037    kitchen kitchenfk2    FK CONSTRAINT     x   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenfk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 <   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenfk2;
       public          postgres    false    219    220    3244            �           2606    17022    order orderfk    FK CONSTRAINT     s   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderfk;
       public          postgres    false    219    3234    212            �           2606    16970    restaurant sectionfk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT sectionfk FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);
 >   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT sectionfk;
       public          postgres    false    210    214    3232            �           2606    16975    restaurant stafffk    FK CONSTRAINT     v   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT stafffk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 <   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT stafffk;
       public          postgres    false    3234    214    212            �           2606    17067    tables tablefk    FK CONSTRAINT     t   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablefk FOREIGN KEY (waiterid) REFERENCES public.waiter(staffid);
 8   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablefk;
       public          postgres    false    3240    216    221            �           2606    17072    tables tablefk2    FK CONSTRAINT     u   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablefk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 9   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablefk2;
       public          postgres    false    219    3244    221            �           2606    17263    tables tablefk3    FK CONSTRAINT     �   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablefk3 FOREIGN KEY (sectionid) REFERENCES public.section(sectionid) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablefk3;
       public          postgres    false    210    221    3232            �           2606    17278    waiter waiterfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiterfk;
       public          postgres    false    212    3234    216            k   _   x�̱@0��ޯ����M6����R4Q�_�ON�~�=��� �
�ᴋ@��oqM�����,ɧU����N�?���]sJI���      g   8   x�37�)-��,�Pp�OKKM�46�47�27�����.�H�N�4��47����� N:M      \   ;   x�3�t���4055U�` �2�K����(@0qq:V���i`ll� �@����� �      c      x������ � �      ^      x�3�L���4��=... 1�      i   h   x��K�0��1m�Q܀qH����'jLX=��I_:!8�q�� 
=R���Ep����y�8
�6fx�iѹ�Z>2��}W4�ݿ�L?�p8�< 8E�      e   -   x�33��H�M*-JO-�45�47�23�N�IL�4r��b���� �}�      a      x������ � �      `   -   x�37�,IL�IU���0�4�27������K�4��4����� �=      [   ?   x�3�t*�/�H-*J-.I,-J�+�N�N,�L�4�4�2�LI�K�M��J�%��Ec���� d�      W   )   x�3���,I�H��2�,IL�I-�2���KK�b���� 
/      Y   &   x�3�LN,��L-�2�,O�,2�9��K�@B1z\\\ ��	�      b      x������ � �      ]      x�3�LN��4�=...  �#     