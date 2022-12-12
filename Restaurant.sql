PGDMP      "                    z         
   Restaurant    14.5    14.5 f    ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16861 
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
       public          postgres    false    232            �           0    0    beveragelist_beverageid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.beveragelist_beverageid_seq OWNED BY public.beveragelist.beverageid;
          public          postgres    false    231            �            1259    17172    beverageorder    TABLE     e   CREATE TABLE public.beverageorder (
    beverageid integer NOT NULL,
    orderid integer NOT NULL
);
 !   DROP TABLE public.beverageorder;
       public         heap    postgres    false            �            1259    17130 	   beverages    TABLE     �   CREATE TABLE public.beverages (
    beverageid integer NOT NULL,
    beveragename character varying(100),
    beverageprice real
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
       public          postgres    false    226            �           0    0    beverages_beverageid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.beverages_beverageid_seq OWNED BY public.beverages.beverageid;
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
       public          postgres    false    230            �           0    0    foodlist_foodid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.foodlist_foodid_seq OWNED BY public.foodlist.foodid;
          public          postgres    false    229            �            1259    17157 	   foodorder    TABLE     ]   CREATE TABLE public.foodorder (
    foodid integer NOT NULL,
    orderid integer NOT NULL
);
    DROP TABLE public.foodorder;
       public         heap    postgres    false            �            1259    17123    foods    TABLE     t   CREATE TABLE public.foods (
    foodid integer NOT NULL,
    foodname character varying(100),
    foodprice real
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
       public          postgres    false    224            �           0    0    foods_foodid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.foods_foodid_seq OWNED BY public.foods.foodid;
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
       public          postgres    false    219            �           0    0    order_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_orderid_seq OWNED BY public."order".orderid;
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
       public          postgres    false    214            �           0    0    restaurant_restaurantid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.restaurant_restaurantid_seq OWNED BY public.restaurant.restaurantid;
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
       public          postgres    false    210            �           0    0    section_sectionid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.section_sectionid_seq OWNED BY public.section.sectionid;
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
       public          postgres    false    212            �           0    0    staff_staffid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.staff_staffid_seq OWNED BY public.staff.staffid;
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
       public          postgres    false    231    232    232            �           2604    17133    beverages beverageid    DEFAULT     |   ALTER TABLE ONLY public.beverages ALTER COLUMN beverageid SET DEFAULT nextval('public.beverages_beverageid_seq'::regclass);
 C   ALTER TABLE public.beverages ALTER COLUMN beverageid DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    17218    foodlist foodid    DEFAULT     r   ALTER TABLE ONLY public.foodlist ALTER COLUMN foodid SET DEFAULT nextval('public.foodlist_foodid_seq'::regclass);
 >   ALTER TABLE public.foodlist ALTER COLUMN foodid DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    17126    foods foodid    DEFAULT     l   ALTER TABLE ONLY public.foods ALTER COLUMN foodid SET DEFAULT nextval('public.foods_foodid_seq'::regclass);
 ;   ALTER TABLE public.foods ALTER COLUMN foodid DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    17019    order orderid    DEFAULT     p   ALTER TABLE ONLY public."order" ALTER COLUMN orderid SET DEFAULT nextval('public.order_orderid_seq'::regclass);
 >   ALTER TABLE public."order" ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16967    restaurant restaurantid    DEFAULT     �   ALTER TABLE ONLY public.restaurant ALTER COLUMN restaurantid SET DEFAULT nextval('public.restaurant_restaurantid_seq'::regclass);
 F   ALTER TABLE public.restaurant ALTER COLUMN restaurantid DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    16953    section sectionid    DEFAULT     v   ALTER TABLE ONLY public.section ALTER COLUMN sectionid SET DEFAULT nextval('public.section_sectionid_seq'::regclass);
 @   ALTER TABLE public.section ALTER COLUMN sectionid DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    16960    staff staffid    DEFAULT     n   ALTER TABLE ONLY public.staff ALTER COLUMN staffid SET DEFAULT nextval('public.staff_staffid_seq'::regclass);
 <   ALTER TABLE public.staff ALTER COLUMN staffid DROP DEFAULT;
       public          postgres    false    211    212    212            {          0    17222    beveragelist 
   TABLE DATA           O   COPY public.beveragelist (beverageid, beveragename, beverageprice) FROM stdin;
    public          postgres    false    232   %r       w          0    17172    beverageorder 
   TABLE DATA           <   COPY public.beverageorder (beverageid, orderid) FROM stdin;
    public          postgres    false    228   Xr       u          0    17130 	   beverages 
   TABLE DATA           L   COPY public.beverages (beverageid, beveragename, beverageprice) FROM stdin;
    public          postgres    false    226   ur       j          0    16985    cashier 
   TABLE DATA           G   COPY public.cashier (staffid, cashiername, cashierphoneno) FROM stdin;
    public          postgres    false    215   �r       q          0    17102    checkout 
   TABLE DATA           A   COPY public.checkout (sectionid, cashierid, orderid) FROM stdin;
    public          postgres    false    222   s       l          0    17005    courier 
   TABLE DATA           G   COPY public.courier (staffid, couriername, courierphoneno) FROM stdin;
    public          postgres    false    217   6s       y          0    17215    foodlist 
   TABLE DATA           ?   COPY public.foodlist (foodid, foodname, foodprice) FROM stdin;
    public          postgres    false    230   \s       v          0    17157 	   foodorder 
   TABLE DATA           4   COPY public.foodorder (foodid, orderid) FROM stdin;
    public          postgres    false    227   �s       s          0    17123    foods 
   TABLE DATA           <   COPY public.foods (foodid, foodname, foodprice) FROM stdin;
    public          postgres    false    224   �s       o          0    17027    kitchen 
   TABLE DATA           5   COPY public.kitchen (sectionid, orderid) FROM stdin;
    public          postgres    false    220   �s       n          0    17016    order 
   TABLE DATA           M   COPY public."order" (orderid, orderaddress, totalprice, staffid) FROM stdin;
    public          postgres    false    219   t       i          0    16964 
   restaurant 
   TABLE DATA           i   COPY public.restaurant (restaurantid, restaurantname, restaurantaddress, sectionid, staffid) FROM stdin;
    public          postgres    false    214   wt       e          0    16950    section 
   TABLE DATA           9   COPY public.section (sectionid, sectiontype) FROM stdin;
    public          postgres    false    210   �t       g          0    16957    staff 
   TABLE DATA           3   COPY public.staff (staffid, stafftype) FROM stdin;
    public          postgres    false    212   �t       p          0    17062    tables 
   TABLE DATA           >   COPY public.tables (sectionid, waiterid, orderid) FROM stdin;
    public          postgres    false    221   5u       k          0    16995    waiter 
   TABLE DATA           D   COPY public.waiter (staffid, waitername, waiterphoneno) FROM stdin;
    public          postgres    false    216   Xu       �           0    0    beveragelist_beverageid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.beveragelist_beverageid_seq', 2, true);
          public          postgres    false    231            �           0    0    beverages_beverageid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.beverages_beverageid_seq', 56, true);
          public          postgres    false    225            �           0    0    foodlist_foodid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.foodlist_foodid_seq', 2, true);
          public          postgres    false    229            �           0    0    foods_foodid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.foods_foodid_seq', 50, true);
          public          postgres    false    223            �           0    0    order_orderid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_orderid_seq', 58, true);
          public          postgres    false    218            �           0    0    restaurant_restaurantid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.restaurant_restaurantid_seq', 3, true);
          public          postgres    false    213            �           0    0    section_sectionid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.section_sectionid_seq', 3, true);
          public          postgres    false    209            �           0    0    staff_staffid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.staff_staffid_seq', 4, true);
          public          postgres    false    211            �           2606    17176    beverageorder beverageorderpk 
   CONSTRAINT     l   ALTER TABLE ONLY public.beverageorder
    ADD CONSTRAINT beverageorderpk PRIMARY KEY (beverageid, orderid);
 G   ALTER TABLE ONLY public.beverageorder DROP CONSTRAINT beverageorderpk;
       public            postgres    false    228    228            �           2606    17135    beverages beveragespk 
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
       public            postgres    false    217            �           2606    17161    foodorder foodorderpk 
   CONSTRAINT     `   ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorderpk PRIMARY KEY (foodid, orderid);
 ?   ALTER TABLE ONLY public.foodorder DROP CONSTRAINT foodorderpk;
       public            postgres    false    227    227            �           2606    17128    foods foodspk 
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
       public            postgres    false    232            �           2606    17220    foodlist unique_foodlist_foodid 
   CONSTRAINT     \   ALTER TABLE ONLY public.foodlist
    ADD CONSTRAINT unique_foodlist_foodid UNIQUE (foodid);
 I   ALTER TABLE ONLY public.foodlist DROP CONSTRAINT unique_foodlist_foodid;
       public            postgres    false    230            �           2606    16999    waiter waiterpk 
   CONSTRAINT     R   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterpk PRIMARY KEY (staffid);
 9   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiterpk;
       public            postgres    false    216            �           2606    17177    beverageorder beverageorderfk    FK CONSTRAINT     �   ALTER TABLE ONLY public.beverageorder
    ADD CONSTRAINT beverageorderfk FOREIGN KEY (beverageid) REFERENCES public.beverages(beverageid);
 G   ALTER TABLE ONLY public.beverageorder DROP CONSTRAINT beverageorderfk;
       public          postgres    false    228    3262    226            �           2606    17182    beverageorder beverageorderfk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.beverageorder
    ADD CONSTRAINT beverageorderfk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 H   ALTER TABLE ONLY public.beverageorder DROP CONSTRAINT beverageorderfk2;
       public          postgres    false    228    219    3252            �           2606    16990    cashier cashierfk    FK CONSTRAINT     u   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 ;   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashierfk;
       public          postgres    false    3242    212    215            �           2606    17107    checkout checkoutfk    FK CONSTRAINT     }   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);
 =   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk;
       public          postgres    false    210    3240    222            �           2606    17112    checkout checkoutfk2    FK CONSTRAINT     |   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk2 FOREIGN KEY (cashierid) REFERENCES public.cashier(staffid);
 >   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk2;
       public          postgres    false    215    3246    222            �           2606    17117    checkout checkoutfk3    FK CONSTRAINT     z   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT checkoutfk3 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 >   ALTER TABLE ONLY public.checkout DROP CONSTRAINT checkoutfk3;
       public          postgres    false    3252    222    219            �           2606    17010    courier courierfk    FK CONSTRAINT     u   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courierfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 ;   ALTER TABLE ONLY public.courier DROP CONSTRAINT courierfk;
       public          postgres    false    212    217    3242            �           2606    17162    foodorder foodorderfk    FK CONSTRAINT     w   ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorderfk FOREIGN KEY (foodid) REFERENCES public.foods(foodid);
 ?   ALTER TABLE ONLY public.foodorder DROP CONSTRAINT foodorderfk;
       public          postgres    false    224    3260    227            �           2606    17167    foodorder foodorderfk2    FK CONSTRAINT     |   ALTER TABLE ONLY public.foodorder
    ADD CONSTRAINT foodorderfk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 @   ALTER TABLE ONLY public.foodorder DROP CONSTRAINT foodorderfk2;
       public          postgres    false    219    227    3252            �           2606    17032    kitchen kitchenfk    FK CONSTRAINT     {   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenfk FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);
 ;   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenfk;
       public          postgres    false    210    3240    220            �           2606    17037    kitchen kitchenfk2    FK CONSTRAINT     x   ALTER TABLE ONLY public.kitchen
    ADD CONSTRAINT kitchenfk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 <   ALTER TABLE ONLY public.kitchen DROP CONSTRAINT kitchenfk2;
       public          postgres    false    220    219    3252            �           2606    17022    order orderfk    FK CONSTRAINT     s   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderfk;
       public          postgres    false    219    212    3242            �           2606    16970    restaurant sectionfk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT sectionfk FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);
 >   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT sectionfk;
       public          postgres    false    3240    210    214            �           2606    16975    restaurant stafffk    FK CONSTRAINT     v   ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT stafffk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 <   ALTER TABLE ONLY public.restaurant DROP CONSTRAINT stafffk;
       public          postgres    false    3242    214    212            �           2606    17067    tables tablefk    FK CONSTRAINT     t   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablefk FOREIGN KEY (waiterid) REFERENCES public.waiter(staffid);
 8   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablefk;
       public          postgres    false    216    221    3248            �           2606    17072    tables tablefk2    FK CONSTRAINT     u   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablefk2 FOREIGN KEY (orderid) REFERENCES public."order"(orderid);
 9   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablefk2;
       public          postgres    false    221    219    3252            �           2606    17077    tables tablefk3    FK CONSTRAINT     y   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tablefk3 FOREIGN KEY (sectionid) REFERENCES public.section(sectionid);
 9   ALTER TABLE ONLY public.tables DROP CONSTRAINT tablefk3;
       public          postgres    false    3240    210    221            �           2606    17000    waiter waiterfk    FK CONSTRAINT     s   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiterfk FOREIGN KEY (staffid) REFERENCES public.staff(staffid);
 9   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiterfk;
       public          postgres    false    216    3242    212            {   #   x3��I���KLI�44�2�,IM�4����� g�^      w      x����� � �      u   I   x31��I���KLI���21�,IM�9�KR�8���8}`*L�L,`
LPt��%�P%LQ����qqq ��$S      j   ;   x3�t���4055U�` �e��
511Q�` �e��Xyt~*�����)�=... �      q      x����� � �      l      x3�L���4��=... 1�      y   +   x3��H�M*-JO-�44�2��MM,QHJ���44������ �(	,      v      x����� � �      s   &   x3��H�M*-JO-���2�L,(�I�4����� �*�      o      x����� � �      n   `   x3��M,N4�445�4�%�I9�
���1~ C��	�g�ej�)C���M�L9�3sr��K�󋲡��Q�͵�LK,��9�bk� �%�      i   ?   x3�t*�/�H-*J-.I,-J�+�N�N,�L�4�4�2�LI�K�M��J�%��Ec���� d�      e   )   x3���,I�H��2�,IL�I-�2���KK�b���� 
/      g   &   x3�LN,��L-�2�,O�,2�9��K�@B1z\\\ ��	�      p      x3�4�4����� �Y      k      x3�LN��4�=...  �#     