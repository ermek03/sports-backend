from rest_framework.generics import *
from rest_framework.permissions import IsAuthenticated
from .permissions import IsOwnerProfileOrReadOnly
from .serializers import *
from django.contrib.auth import get_user_model
from rest_framework.response import Response
from rest_framework import status
from fcm_django.models import FCMDevice


# Create your views here.

class UserDetailView(RetrieveUpdateAPIView):
    serializer_class = UserProfileSerializer
    permission_classes = [IsOwnerProfileOrReadOnly, IsAuthenticated]

    def get(self, request, *args, **kwargs):
        queryset = UserProfile.objects.all()
        user_profile = get_object_or_404(queryset, user_id=kwargs['pk'])
        serializer = self.get_serializer(user_profile)
        return Response(serializer.data)

    def update(self, request, *args, **kwargs):
        queryset = UserProfile.objects.all()
        user_profile = get_object_or_404(queryset, user_id=kwargs['pk'])
        if user_profile:
            serializer = self.get_serializer(user_profile, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class FcmCreateView(UpdateAPIView):
    serializer_class = FcmCreateSerializer
    permission_classes = [IsAuthenticated]

    def update(self, request, *args, **kwargs):
        user = get_user_model().objects.get(id=request.data['user'])
        if user:

            try:
                fcm = FCMDevice.objects.get(user=request.data['user'])
                fcm.registration_id = request.data['registration_id']
                fcm.type = request.data['type']
                fcm.active = request.data['active']
                fcm.save()
            except FCMDevice.DoesNotExist:
                FCMDevice.objects.create(
                    user=user,
                    name=request.data['name'],
                    device_id=request.data['device_id'],
                    registration_id=request.data['registration_id'],
                    type=request.data['type'],
                )

            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)