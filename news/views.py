import requests
from django.http import HttpResponse
from rest_framework import status
from rest_framework.response import Response

from instagram_web_api import Client
from rest_framework.views import APIView
import json
from bs4 import BeautifulSoup

NEWS_CATEGORY = {
    'football': 'https://sport.kg/thefootball/',
    'futsal': 'https://sport.kg/futsal/',
    'volleyball': 'https://sport.kg/team-sports/volleyball/'
}


# Without any authentication
class News(APIView):
    def get(self, request, *args, **kwargs):
        name = self.kwargs['name']
        page = str(self.kwargs['page'])
        if page == 1:
            name = NEWS_CATEGORY.get(name)
        else:
            name = NEWS_CATEGORY.get(name) + 'page/' + page + '/'

        try:
            page = requests.get(name)
            soup = BeautifulSoup(page.content, 'html.parser')
            all_content = soup.find_all('div', class_='featured-post')
            news = {
                'results': [],
                'paginations': []
            }
            for content in all_content:
                try:
                    image = content.find(class_='highslide')['href']
                except:
                    image = None

                news['results'].append({
                    'title': content.find(class_='post-title').get_text(),
                    'date': content.find(class_='post-author').get_text(),
                    'link': content.find(class_='post-title')['href'],
                    'image': image,
                    'description': content.find(class_='mb-15').get_text(),
                })

            all_page = soup.find('div', class_='pagination').find_all()
            for page in all_page:
                if page.get_text() != '':
                    try:
                        link = page['href']
                    except:
                        link = None
                    news['paginations'].append({
                        'number': page.get_text(),
                        'link': link
                    })

            news['results'].pop()
            return HttpResponse(json.dumps(news), content_type="application/json")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)


# Without any authentication
class NewsDetail(APIView):
    def post(self, request, *args, **kwargs):
        try:
            url = request.data['url']
            print(url)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        try:
            page = requests.get(url)
            soup = BeautifulSoup(page.content, 'html.parser')
            content = soup.find(class_='post-data')
            try:
                image = content.find(class_='highslide')['href']
            except:
                image = None

            description = []
            description_list = content.findChildren('p')
            for desc in description_list:
                description.append(desc.get_text())

            news = {
                'title': content.find('h5').get_text(),
                'date': content.find(class_='post-date').get_text(),
                'image': image,
                'description':  description,
            }
            return HttpResponse(json.dumps(news), content_type="application/json")
        except:
            pass
