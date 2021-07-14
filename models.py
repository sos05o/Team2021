# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class RingisyoApprovalFlag(models.Model):
    flag = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'ringisyo_approval_flag'


class RingisyoDepartment(models.Model):
    name = models.CharField(max_length=24)

    class Meta:
        managed = False
        db_table = 'ringisyo_department'


class RingisyoPosition(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'ringisyo_position'


class RingisyoPurchaseFlag(models.Model):
    flag = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'ringisyo_purchase_flag'


class RingisyoRingisyo(models.Model):
    title = models.CharField(max_length=32)
    deadline = models.DateField()
    product_title = models.CharField(max_length=32)
    trader_name = models.CharField(max_length=32)
    quantity = models.IntegerField()
    unit_price = models.IntegerField()
    need_reason = models.CharField(max_length=512)
    trader_reason = models.CharField(max_length=512)
    auth_id = models.ForeignKey(RingisyoPosition, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'ringisyo_ringisyo'


class RingisyoRingisyoApv(models.Model):
    id = models.OneToOneField(RingisyoRingisyo, models.DO_NOTHING, primary_key=True)
    remarks = models.CharField(max_length=512)
    chief_apv = models.ForeignKey(RingisyoApprovalFlag, models.DO_NOTHING)
    director_apv = models.ForeignKey(RingisyoApprovalFlag, models.DO_NOTHING)
    mdirector_apv = models.ForeignKey(RingisyoApprovalFlag, models.DO_NOTHING, db_column='mDirector_apv_id')  # Field name made lowercase.
    president_apv = models.ForeignKey(RingisyoApprovalFlag, models.DO_NOTHING)
    purchase = models.ForeignKey(RingisyoPurchaseFlag, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'ringisyo_ringisyo_apv'


class RingisyoUserInfo(models.Model):
    id = models.IntegerField(primary_key=True)
    firstname = models.CharField(db_column='firstName', max_length=16)  # Field name made lowercase.
    lastname = models.CharField(db_column='lastName', max_length=16)  # Field name made lowercase.
    birth = models.DateField()
    boss_id = models.IntegerField()
    mailaddress = models.CharField(db_column='mailAddress', max_length=64)  # Field name made lowercase.
    salt = models.CharField(max_length=32)
    hashed_pw = models.CharField(max_length=64)
    dep_id = models.ForeignKey(RingisyoDepartment, models.DO_NOTHING)
    pos_id = models.ForeignKey(RingisyoPosition, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'ringisyo_user_info'
