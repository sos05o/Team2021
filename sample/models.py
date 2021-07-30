# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Approval(models.Model):
    approval_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=32)
    user = models.ForeignKey('User', models.DO_NOTHING)
    limited = models.DateField()
    goods = models.CharField(max_length=32)
    trader = models.CharField(max_length=32)
    quantity = models.IntegerField()
    price = models.IntegerField()
    necessity_reason = models.CharField(max_length=512)
    trader_reason = models.CharField(max_length=512)
    purchase = models.IntegerField(blank=True, null=True)
    p_chief = models.IntegerField(blank=True, null=True)
    p_director = models.IntegerField(blank=True, null=True)
    p_mdirectop = models.IntegerField(blank=True, null=True)
    p_president = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'approval'


class Department(models.Model):
    department_id = models.AutoField(primary_key=True)
    department_name = models.CharField(max_length=32)

    class Meta:
        managed = True
        db_table = 'department'


class Position(models.Model):
    position_id = models.IntegerField(primary_key=True)
    position_name = models.CharField(max_length=32)

    class Meta:
        managed = True
        db_table = 'position'


class Remarks(models.Model):
    approval = models.OneToOneField(Approval, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('User', models.DO_NOTHING)
    remarks = models.CharField(max_length=512, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'remarks'
        unique_together = (('approval', 'user'),)


class User(models.Model):
    user_id = models.IntegerField(primary_key=True)
    last_name = models.CharField(max_length=32)
    first_name = models.CharField(max_length=32)
    birthday = models.DateField()
    boss = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    position = models.ForeignKey(Position, models.DO_NOTHING)
    department = models.ForeignKey(Department, models.DO_NOTHING)
    mail = models.CharField(unique=True, max_length=64)
    salt = models.CharField(max_length=32)
    pw = models.CharField(max_length=64)
    login_flag = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'user'
