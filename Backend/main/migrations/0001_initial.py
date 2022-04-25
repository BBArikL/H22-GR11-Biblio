# Generated by Django 4.0.2 on 2022-04-18 19:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserList',
            fields=[
                ('id_users', models.CharField(db_column='ID_Users', max_length=16, primary_key=True, serialize=False)),
                ('password_hash', models.CharField(db_column='Password_Hash', max_length=255)),
                ('name', models.CharField(db_column='Name', max_length=50)),
                ('first_name', models.CharField(db_column='First_Name', max_length=100)),
                ('date_birth', models.DateField(db_column='Date_Birth')),
                ('fees', models.DecimalField(db_column='Fees', decimal_places=0, max_digits=10)),
                ('email', models.CharField(db_column='Email', max_length=255, unique=True)),
                ('addresse_postale', models.CharField(db_column='Postal_Code', max_length=6)),
                ('expiration_subscription', models.DateField(db_column='Expiration_Subscription')),
                ('permissions', models.CharField(db_column='Permissions', max_length=2)),
                ('related_library_id', models.CharField(blank=True, db_column='Related_Library_ID', max_length=2, null=True)),
            ],
            options={
                'db_table': 'User_List',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='WorkList',
            fields=[
                ('id_works', models.CharField(db_column='ID_Works', max_length=20, primary_key=True, serialize=False)),
                ('name_works', models.CharField(db_column='Name_Works', max_length=50)),
                ('author_name', models.CharField(db_column='Author_Name', max_length=255)),
                ('publication_date', models.DateField(db_column='Publication_Date')),
                ('edition_house', models.CharField(db_column='Edition_House', max_length=45)),
                ('length', models.PositiveIntegerField(db_column='Length')),
                ('resume', models.TextField(db_column='Resume', max_length=2000)),
                ('genre', models.CharField(db_column='Genre', max_length=2)),
                ('language', models.CharField(db_column='Language', max_length=18)),
                ('state', models.BinaryField(db_column='State')),
                ('copy_number', models.PositiveIntegerField(db_column='Copy_Number')),
                ('type_work', models.CharField(db_column='Type_Work', max_length=2)),
                ('price', models.DecimalField(db_column='Price', decimal_places=3, max_digits=5)),
            ],
            options={
                'db_table': 'Work_List',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Work_Media_List',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('photo_path_work', models.TextField(default='https://raw.githubusercontent.com/BiblioLexicus/Design/main/Book_image_not_found.jpg', max_length=10000)),
                ('id_works', models.ForeignKey(db_column='ID_Works', on_delete=django.db.models.deletion.CASCADE, to='main.worklist')),
            ],
        ),
        migrations.CreateModel(
            name='User_Media_List',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('photo_path_work', models.TextField(default='https://raw.githubusercontent.com/BiblioLexicus/Design/main/BiblioLex.png', max_length=10000)),
                ('id_user', models.ForeignKey(db_column='User_List', on_delete=django.db.models.deletion.CASCADE, to='main.worklist')),
            ],
        ),
        migrations.CreateModel(
            name='LibrariesData',
            fields=[
                ('schedules', models.CharField(db_column='Schedules', max_length=11)),
                ('postal_code', models.CharField(db_column='Postal_Code', max_length=6)),
                ('library_website', models.CharField(db_column='Library_Website', max_length=45)),
                ('phone_address', models.CharField(db_column='Phone_Address', max_length=14)),
                ('library_name', models.CharField(blank=True, db_column='Library_Name', max_length=45, null=True)),
                ('id_library', models.CharField(db_column='ID_Library', max_length=2, primary_key=True, serialize=False)),
                ('id_users', models.ForeignKey(db_column='ID_Users', on_delete=django.db.models.deletion.DO_NOTHING, to='main.userlist')),
            ],
            options={
                'db_table': 'Libraries_Data',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Comments',
            fields=[
                ('id_comments', models.IntegerField(db_column='ID_Comments', primary_key=True, serialize=False)),
                ('release_date', models.DateTimeField(db_column='Release_Date')),
                ('comment_text', models.TextField(db_column='Comment_Text')),
                ('id_users', models.ForeignKey(db_column='ID_Users', on_delete=django.db.models.deletion.DO_NOTHING, to='main.userlist')),
                ('id_works', models.ForeignKey(db_column='ID_Works', on_delete=django.db.models.deletion.DO_NOTHING, to='main.worklist')),
            ],
            options={
                'db_table': 'Comments',
                'managed': True,
                'unique_together': {('id_comments', 'id_works', 'id_users')},
            },
        ),
        migrations.CreateModel(
            name='LoanedWorks',
            fields=[
                ('id_works', models.OneToOneField(db_column='ID_Works', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='main.worklist')),
                ('end_loan_date', models.DateField(db_column='End_Loan_Date')),
                ('work_lost', models.BinaryField(db_column='Work_Lost')),
                ('id_users', models.ForeignKey(db_column='ID_Users', on_delete=django.db.models.deletion.DO_NOTHING, to='main.userlist')),
            ],
            options={
                'db_table': 'Loaned_Works',
                'managed': True,
                'unique_together': {('id_works', 'id_users')},
            },
        ),
    ]
