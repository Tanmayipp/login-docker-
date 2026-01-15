from django.shortcuts import render, redirect
from .forms import CustomUserForm
from django.contrib.auth.models import User

def register(request):
    if request.method == 'POST':
        form = CustomUserForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            # Create user and hash password
            user = User.objects.create_user(username=username, email=email, password=password)
            user.save()
            return redirect('login')
    else:
        form = CustomUserForm()
    return render(request, 'registration/register.html', {'form': form})

def home(request):
    return render(request, 'home.html')
