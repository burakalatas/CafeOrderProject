using System;
using System.Collections.Generic;
using DbmsHw.Entities;
using Microsoft.EntityFrameworkCore;

namespace DbmsHw.Context;

public partial class RestaurantContext : DbContext
{
    public RestaurantContext()
    {
    }

    public RestaurantContext(DbContextOptions<RestaurantContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Beverage> Beverages { get; set; }

    public virtual DbSet<Beveragelist> Beveragelists { get; set; }

    public virtual DbSet<Beveragelistpricechange> Beveragelistpricechanges { get; set; }

    public virtual DbSet<Cashier> Cashiers { get; set; }

    public virtual DbSet<Checkout> Checkouts { get; set; }

    public virtual DbSet<Courier> Couriers { get; set; }

    public virtual DbSet<DeletedOrder> DeletedOrders { get; set; }

    public virtual DbSet<Food> Foods { get; set; }

    public virtual DbSet<Foodlist> Foodlists { get; set; }

    public virtual DbSet<Foodlistpricechange> Foodlistpricechanges { get; set; }

    public virtual DbSet<Kitchen> Kitchens { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Staff> Staff { get; set; }

    public virtual DbSet<Table> Tables { get; set; }

    public virtual DbSet<Waiter> Waiters { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("User ID=postgres;Password=19391945;Host=localhost;Port=5432;Database=Restaurant;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Beverage>(entity =>
        {
            entity.HasKey(e => e.Beverageid).HasName("beveragespk");

            entity.ToTable("beverages");

            entity.Property(e => e.Beverageid).HasColumnName("beverageid");
            entity.Property(e => e.Beveragename)
                .HasMaxLength(100)
                .HasColumnName("beveragename");
            entity.Property(e => e.Beverageprice).HasColumnName("beverageprice");
            entity.Property(e => e.Orderid).HasColumnName("orderid");

            entity.HasOne(d => d.Order).WithMany(p => p.Beverages)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("beveragesfk");
        });

        modelBuilder.Entity<Beveragelist>(entity =>
        {
            entity.HasKey(e => e.Beverageid).HasName("beveragelistpk");

            entity.ToTable("beveragelist");

            entity.HasIndex(e => e.Beverageid, "unique_beveragelist_beverageid").IsUnique();

            entity.Property(e => e.Beverageid).HasColumnName("beverageid");
            entity.Property(e => e.Beveragename)
                .HasColumnType("character varying")
                .HasColumnName("beveragename");
            entity.Property(e => e.Beverageprice).HasColumnName("beverageprice");
        });

        modelBuilder.Entity<Beveragelistpricechange>(entity =>
        {
            entity.HasKey(e => e.Beveragelistrecordno).HasName("beveragelistpricechangespk");

            entity.ToTable("beveragelistpricechanges");

            entity.Property(e => e.Beveragelistrecordno).HasColumnName("beveragelistrecordno");
            entity.Property(e => e.Beverageid).HasColumnName("beverageid");
            entity.Property(e => e.Newbeverageprice).HasColumnName("newbeverageprice");
            entity.Property(e => e.Oldbeverageprice).HasColumnName("oldbeverageprice");
            entity.Property(e => e.Updatedate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updatedate");
        });

        modelBuilder.Entity<Cashier>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("cashierpk");

            entity.ToTable("cashier");

            entity.Property(e => e.Staffid)
                .ValueGeneratedNever()
                .HasColumnName("staffid");

            entity.HasOne(d => d.Staff).WithOne(p => p.Cashier)
                .HasForeignKey<Cashier>(d => d.Staffid)
                .HasConstraintName("cashierfk");
        });

        modelBuilder.Entity<Checkout>(entity =>
        {
            entity.HasKey(e => e.Sectionid).HasName("checkoutpk");

            entity.ToTable("checkout");

            entity.Property(e => e.Sectionid)
                .ValueGeneratedNever()
                .HasColumnName("sectionid");
            entity.Property(e => e.Cashierid).HasColumnName("cashierid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");

            entity.HasOne(d => d.Cashier).WithMany(p => p.Checkouts)
                .HasForeignKey(d => d.Cashierid)
                .HasConstraintName("checkoutfk2");

            entity.HasOne(d => d.Order).WithMany(p => p.Checkouts)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("checkoutfk3");
        });

        modelBuilder.Entity<Courier>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("courierpk");

            entity.ToTable("courier");

            entity.Property(e => e.Staffid)
                .ValueGeneratedNever()
                .HasColumnName("staffid");

            entity.HasOne(d => d.Staff).WithOne(p => p.Courier)
                .HasForeignKey<Courier>(d => d.Staffid)
                .HasConstraintName("courierfk");
        });

        modelBuilder.Entity<DeletedOrder>(entity =>
        {
            entity.HasKey(e => e.DeletedOrdersId).HasName("deletedOrdersPk");

            entity.ToTable("deletedOrders");

            entity.Property(e => e.DeletedOrdersId).HasColumnName("deletedOrdersId");
            entity.Property(e => e.DeletedDate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("deletedDate");
            entity.Property(e => e.OrderAddress)
                .HasColumnType("character varying")
                .HasColumnName("orderAddress");
            entity.Property(e => e.OrderId).HasColumnName("orderId");
            entity.Property(e => e.StaffId).HasColumnName("staffId");
            entity.Property(e => e.TableId).HasColumnName("tableId");
        });

        modelBuilder.Entity<Food>(entity =>
        {
            entity.HasKey(e => e.Foodid).HasName("foodspk");

            entity.ToTable("foods");

            entity.Property(e => e.Foodid).HasColumnName("foodid");
            entity.Property(e => e.Foodname)
                .HasMaxLength(100)
                .HasColumnName("foodname");
            entity.Property(e => e.Foodprice).HasColumnName("foodprice");
            entity.Property(e => e.Orderid).HasColumnName("orderid");

            entity.HasOne(d => d.Order).WithMany(p => p.Foods)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("foodsdk");
        });

        modelBuilder.Entity<Foodlist>(entity =>
        {
            entity.HasKey(e => e.Foodid).HasName("foodlistpk");

            entity.ToTable("foodlist");

            entity.HasIndex(e => e.Foodid, "unique_foodlist_foodid").IsUnique();

            entity.Property(e => e.Foodid).HasColumnName("foodid");
            entity.Property(e => e.Foodname)
                .HasMaxLength(100)
                .HasColumnName("foodname");
            entity.Property(e => e.Foodprice).HasColumnName("foodprice");
        });

        modelBuilder.Entity<Foodlistpricechange>(entity =>
        {
            entity.HasKey(e => e.Foodlistrecordno).HasName("PK");

            entity.ToTable("foodlistpricechanges");

            entity.Property(e => e.Foodlistrecordno).HasColumnName("foodlistrecordno");
            entity.Property(e => e.Foodid).HasColumnName("foodid");
            entity.Property(e => e.Newfoodprice).HasColumnName("newfoodprice");
            entity.Property(e => e.Oldfoodprice).HasColumnName("oldfoodprice");
            entity.Property(e => e.Updatedate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("updatedate");
        });

        modelBuilder.Entity<Kitchen>(entity =>
        {
            entity.HasKey(e => e.Sectionid).HasName("kitchenpk");

            entity.ToTable("kitchen");

            entity.Property(e => e.Sectionid)
                .ValueGeneratedNever()
                .HasColumnName("sectionid");
            entity.Property(e => e.Orderid).HasColumnName("orderid");

            entity.HasOne(d => d.Order).WithMany(p => p.Kitchens)
                .HasForeignKey(d => d.Orderid)
                .HasConstraintName("kitchenfk2");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Orderid).HasName("orderpk");

            entity.ToTable("order");

            entity.Property(e => e.Orderid).HasColumnName("orderid");
            entity.Property(e => e.Orderaddress)
                .HasMaxLength(300)
                .HasColumnName("orderaddress");
            entity.Property(e => e.Staffid).HasColumnName("staffid");
            entity.Property(e => e.Tableid).HasColumnName("tableid");
            entity.Property(e => e.Totalprice).HasColumnName("totalprice");

            entity.HasOne(d => d.Staff).WithMany(p => p.Orders)
                .HasForeignKey(d => d.Staffid)
                .HasConstraintName("orderfk");

            entity.HasOne(d => d.Table).WithMany(p => p.Orders)
                .HasForeignKey(d => d.Tableid)
                .HasConstraintName("tablefk");
        });

        modelBuilder.Entity<Staff>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("staffpk");

            entity.ToTable("staff");

            entity.Property(e => e.Staffid).HasColumnName("staffid");
            entity.Property(e => e.Staffname)
                .HasColumnType("character varying")
                .HasColumnName("staffname");
            entity.Property(e => e.Staffphoneno)
                .HasMaxLength(11)
                .IsFixedLength()
                .HasColumnName("staffphoneno");
            entity.Property(e => e.Stafftype)
                .HasMaxLength(50)
                .HasColumnName("stafftype");
        });

        modelBuilder.Entity<Table>(entity =>
        {
            entity.HasKey(e => e.Tableid).HasName("tablespk");

            entity.ToTable("tables");

            entity.HasIndex(e => e.Tableid, "unique_tables_tableid").IsUnique();

            entity.Property(e => e.Tableid)
                .ValueGeneratedNever()
                .HasColumnName("tableid");
        });

        modelBuilder.Entity<Waiter>(entity =>
        {
            entity.HasKey(e => e.Staffid).HasName("waiterpk");

            entity.ToTable("waiter");

            entity.Property(e => e.Staffid)
                .ValueGeneratedNever()
                .HasColumnName("staffid");

            entity.HasOne(d => d.Staff).WithOne(p => p.Waiter)
                .HasForeignKey<Waiter>(d => d.Staffid)
                .HasConstraintName("waiterfk");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
