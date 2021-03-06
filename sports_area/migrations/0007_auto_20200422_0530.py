# Generated by Django 3.0.4 on 2020-04-22 05:30

from django.db import migrations
import smart_selects.db_fields


class Migration(migrations.Migration):

    dependencies = [
        ('sports_area', '0006_auto_20200331_1148'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sportsarea',
            name='infrastructure',
            field=smart_selects.db_fields.ChainedManyToManyField(chained_field='category', chained_model_field='category', horizontal=True, to='sports_area.Infrastructure', verbose_name='Инфрастрактура'),
        ),
    ]
