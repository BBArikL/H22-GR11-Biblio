# Generated by Django 4.0.3 on 2022-04-04 18:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("main", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="LibraryUserProfile",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("date_birth", models.DateField(db_column="Date_Birth")),
                (
                    "fees",
                    models.DecimalField(
                        db_column="Fees", decimal_places=4, default=0.0, max_digits=10
                    ),
                ),
                (
                    "addresse_postale",
                    models.CharField(db_column="Addresse_Postale", max_length=6),
                ),
                (
                    "expiration_subscription",
                    models.DateField(db_column="Expiration_Subscription"),
                ),
                (
                    "permissions",
                    models.CharField(
                        db_column="Permissions", default="OO", max_length=2
                    ),
                ),
                (
                    "related_library_id",
                    models.CharField(
                        blank=True,
                        db_column="Related_Library_ID",
                        max_length=2,
                        null=True,
                    ),
                ),
            ],
            options={
                "db_table": "User_List",
                "managed": False,
            },
        ),
        migrations.DeleteModel(
            name="LibraryUser",
        ),
    ]