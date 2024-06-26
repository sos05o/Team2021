# Generated by Django 3.0.2 on 2021-07-30 02:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Approval',
            fields=[
                ('approval_id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=32)),
                ('limited', models.DateField()),
                ('goods', models.CharField(max_length=32)),
                ('trader', models.CharField(max_length=32)),
                ('quantity', models.IntegerField()),
                ('price', models.IntegerField()),
                ('necessity_reason', models.CharField(max_length=512)),
                ('trader_reason', models.CharField(max_length=512)),
                ('purchase', models.IntegerField(blank=True, null=True)),
                ('p_chief', models.IntegerField(blank=True, null=True)),
                ('p_director', models.IntegerField(blank=True, null=True)),
                ('p_mdirectop', models.IntegerField(blank=True, null=True)),
                ('p_president', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'approval',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('department_id', models.AutoField(primary_key=True, serialize=False)),
                ('department_name', models.CharField(max_length=32)),
            ],
            options={
                'db_table': 'department',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Position',
            fields=[
                ('position_id', models.IntegerField(primary_key=True, serialize=False)),
                ('position_name', models.CharField(max_length=32)),
            ],
            options={
                'db_table': 'position',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('user_id', models.IntegerField(primary_key=True, serialize=False)),
                ('last_name', models.CharField(max_length=32)),
                ('first_name', models.CharField(max_length=32)),
                ('birthday', models.DateField()),
                ('mail', models.CharField(max_length=64, unique=True)),
                ('salt', models.CharField(max_length=32)),
                ('pw', models.CharField(max_length=64)),
                ('login_flag', models.IntegerField()),
            ],
            options={
                'db_table': 'user',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Remarks',
            fields=[
                ('approval', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='common.Approval')),
                ('remarks', models.CharField(blank=True, max_length=512, null=True)),
            ],
            options={
                'db_table': 'remarks',
                'managed': True,
            },
        ),
    ]
